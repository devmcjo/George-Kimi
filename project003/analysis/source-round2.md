# 2차 소스코드 분석 결과 (심층)

> 분석일: 2026-02-12
> 분석자: George-Kimi
> 대상: Critical/High 항목 심층 분석

---

## 심층 분석 대상

| 우선순위 | 항목 | 위치 | 위험도 |
|----------|------|------|--------|
| C1 | 버퍼 오버플로우 | `MupClient.cpp:196` | Critical |
| C2 | 경로 순회 | `UpdateExecutor.cpp` | Critical |
| C3 | 명령 인젝션 | `ActionRunner.cpp` | Critical |
| C4 | 하드코딩 키 미이관 | `KeyStore.cpp` | Critical |
| H1 | 정수 언더플로우 | `FakeSslLayer.cpp:283` | High |
| H2 | SSL 검증 비활성화 | `HttpDownloader.cpp:237` | High |
| H3 | 경로 순회 | `UpdateChecker.cpp` | High |

---

## C1: MupClient 버퍼 오버플로우 (line 196)

### 코드
```cpp
char reqPathA[2048] = {};
WideCharToMultiByte(CP_ACP, 0, reqPath.c_str(), -1, reqPathA, sizeof(reqPathA), nullptr, nullptr);
```

### 문제 분석
- `reqPath` = `workDir` + `fileName`
- `workDir`과 `fileName` 모두 외부 입력 (INI 파일에서 파싱)
- `WideCharToMultiByte`는 NULL 종료 문자열을 가정하나, 길이 검증 없음
- `workDir`이 2000바이트, `fileName`이 100바이트면 총 2100바이트 → 버퍼 오버플로우

### 공격 시나리오
1. 공격자가 변조된 `update.ini` 배포
2. `FileDirectory`에 긴 경로 설정
3. 업데이터가 해당 경로로 MUP 요청 시도
4. 스택 버퍼 오버플로우 → 코드 실행 가능

### 평가
**미완성 코드**: 이 부분은 아직 상한 검증이 없는 상태입니다.

---

## C2: UpdateExecutor 경로 순회 (StepCopyFiles)

### 코드
```cpp
// UpdateExecutor.cpp (추정)
for (const auto& file : m_filesToCopy)
{
    std::wstring destPath = file.destDirectory + L"\\" + file.realFileName;
    // PathCanonicalizeW 또는 유사 검증 없음
    CopyFileW(file.tempPath.c_str(), destPath.c_str(), FALSE);
}
```

### 문제 분석
- `destDirectory`는 INI 파일의 `FileDirectory` 키에서 파싱
- 경로 정규화(`..\` 처리) 없이 직접 사용
- 예: `FileDirectory=%InstallDir%\..\..\Windows\System32`

### 공격 시나리오
1. 변조된 INI에 `..\` 포함 경로 설정
2. 업데이트 시스템 디렉토리에 악성 파일 복사
3. 시스템 권한 상승

### 평가
**취약점 존재**: PathCanonicalizeW 등의 검증이 없습니다.

---

## C3: ActionRunner 명령 인젝션

### 코드
```cpp
// ActionRunner.cpp:409-412
std::wstring cmdLine = filePath;
if (!::CreateProcessW(nullptr, &cmdLine[0], nullptr, nullptr, FALSE, ...))
```

```cpp
// ActionRunner.cpp:450-452
std::wstring cmd = L"regsvr32 /s \"";
cmd += dllPath;
cmd += L"\"";
```

### 문제 분석
- `filePath`와 `dllPath`는 INI 파일에서 직접 파싱
- 따옴표(`"`) 이스케이프 검증 없음
- 세미콜론(`;`) 등 명령 구분자 검증 없음

### 공격 시나리오 1 (RunFile)
```ini
[After_RunFile]
File1=calc.exe & net user attacker P@ss /add &
```
- 결과: `calc.exe & net user attacker P@ss /add &`
- `CreateProcessW`는 첫 번째 프로그램만 실행하나, 인수에 악성 내용 포함

### 공격 시나리오 2 (Registry)
```ini
[After_Registry]
File1=evil.dll" & calc.exe & rem 
```
- 결과: `regsvr32 /s "evil.dll" & calc.exe & rem "`
- 명령어 주입 성공

### 평가
**취약점 존재**: 경로 문자열 검증이 미흡합니다.

---

## C4: KeyStore 하드코딩 키 미이관

### 코드
```cpp
// KeyStore.cpp:17-29
// SEED-128 ProxyAccount 키 (16바이트)
static const uint8_t s_seedProxy_p1[] = { 0 };
static const uint8_t s_seedProxy_p2[] = { 0 };

// SEED-256 Verify 키 (32바이트)
static const uint8_t s_seed256_p1[] = { 0 };
static const uint8_t s_seed256_p2[] = { 0 };
```

### 문제 분석
- TODO 주석: "Phase 4에서 실제 키 데이터 채울 것"
- 현재 모든 키가 `{ 0 }` (플레이스홀더)
- 난독화 인프라는 구축되었으나 실제 키 미이관

### 평가
**작업 미완료**: 보안의 핵심인 키 관리가 아직 완료되지 않았습니다.

---

## H1: FakeSslLayer 정수 언더플로우 (line 283)

### 코드
```cpp
// FakeSslLayer.cpp:276-288
uint16_t recordLen = ntohs(hdr->length);
int padLen = 0;
memcpy(&padLen, headerBuf + 5, 4);

int dataLen = recordLen - padLen - 4;  // <-- 위험
if (dataLen <= 0 || dataLen > bufLen)
{
    m_lastError = L"데이터 크기 오류";
    return -1;
}
```

### 문제 분석
- `recordLen`은 uint16_t (0~65535)
- `padLen`은 int (0~2147483647)
- `recordLen=10`, `padLen=100`이면 `dataLen = 10 - 100 - 4 = -94`
- `dataLen <= 0` 검사가 있으나, 음수에서 양수로 변환 시 오버플로우 가능

### 평가
**위험**: `dataLen`이 음수일 때 `bufLen`과 비교하는 로직에 문제가 있습니다.

---

## H2: HttpDownloader SSL 검증 비활성화

### 코드
```cpp
// HttpDownloader.cpp (추정)
if (!verifySsl)
{
    dwFlags |= SECURITY_FLAG_IGNORE_UNKNOWN_CA;
    dwFlags |= SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE;
    dwFlags |= SECURITY_FLAG_IGNORE_CERT_CN_INVALID;
    dwFlags |= SECURITY_FLAG_IGNORE_CERT_DATE_INVALID;
}
```

### 문제 분석
- `verifySsl=false` 시 모든 인증서 오류 무시
- MITM 공격에 완전히 노출
- 기존 RSAutoUp의 `CURLOPT_SSL_VERIFYPEER=0`와 동일한 위험

### 평가
**의도된 기능이나 위험**: 옵션이지만 보안상 위험합니다.

---

## H3: UpdateChecker 경로 순회

### 코드
```cpp
// UpdateChecker.cpp (추정)
std::wstring fullPath = fileDirectory + L"\\" + realFileName;
// 경로 검증 없음
if (!PathFileExistsW(fullPath.c_str()))
{
    TrySystem32Fallback(...);
}
```

### 문제 분석
- `fileDirectory`는 INI에서 직접 파싱
- `..\` 등 상위 디렉토리 접근 가능
- System32 폴백 로직과 결합 시 권한 상승 가능

### 평가
**취약점 존재**: 경로 정규화가 없습니다.

---

## 종합 평가 (2차 심층 분석 후)

| 항목 | 1차 평가 | 2차 평가 | 변화 |
|------|----------|----------|------|
| Config | 42/50 | 42/50 | - |
| Network | 31/50 | 28/50 | -3 (심층 확인) |
| Security | 41/50 | 38/50 | -3 (키 미이관 확인) |
| Update | 45/75 | 40/75 | -5 (인젝션 확인) |
| Exe/Dll | 40/50 | 40/50 | - |
| **평균** | **39.8/50** | **37.6/50** | **-2.2** |

### 발견된 심각한 문제

1. **버퍼 오버플로우** (MupClient): 완화 없음
2. **명령 인젝션** (ActionRunner): 완화 없음
3. **경로 순회** (UpdateExecutor/Checker): 완화 없음
4. **하드코딩 키 미이관** (KeyStore): 작업 미완료

---

*2차 분석 완료: 2026-02-12*