# 1차 소스코드 분석 결과

> 분석일: 2026-02-12
> 분석자: George-Kimi
> 대상: C:\Alice-repo\project116\rsautoup26\

---

## 개요

| 항목 | 내용 |
|------|------|
| **총 파일 수** | 49개 |
| **코드 라인 수** | 약 3,500+ 라인 |
| **분석 모듈** | 6개 (Config, Network, Security, Update, Exe, Dll) |
| **분석 방법** | 정적 코드 분석, 취약점 패턴 검색 |

---

## 종합 평가

| 모듈 | 코드 품질 | 기능 완성도 | 보안성 | 총점 | 등급 |
|------|-----------|-------------|--------|------|------|
| **Config** | 22/25 | 20/25 | - | 42/50 | B+ |
| **Network** | 18/25 | - | 13/25 | 31/50 | C |
| **Security** | 22/25 | - | 19/25 | 41/50 | B+ |
| **Update** | 19/25 | 18/25 | 8/25 | 45/75 | C+ |
| **Exe/Dll** | 18/25 | 22/25 | - | 40/50 | B |
| **평균** | **19.8/25** | **20/25** | **13.3/25** | **39.8/50** | **B-** |

---

## 주요 발견 사항

### 🔴 Critical (즉시 수정 필요)

| # | 위치 | 문제 | 설명 |
|---|------|------|------|
| C1 | `MupClient.cpp:196` | 버퍼 오버플로우 | `reqPathA[2048]`에 경로 복사 시 길이 검증 없음 |
| C2 | `UpdateExecutor.cpp` | 경로 순회 공격 | `destPath` 검증 없이 파일 복사 |
| C3 | `ActionRunner.cpp` | 명령 인젝션 | `CreateProcessW`에 외부 입력 직접 전달 |
| C4 | `KeyStore.cpp` | 하드코딩 키 미이관 | TODO: "Phase 4에서 실제 키 데이터 채울 것" - 현재 플레이스홀더 |

### 🟠 High (조기 수정 필요)

| # | 위치 | 문제 | 설명 |
|---|------|------|------|
| H1 | `FakeSslLayer.cpp:283` | 정수 언더플로우 | `dataLen = recordLen - padLen - 4` 계산 시 음수 가능 |
| H2 | `HttpDownloader.cpp:237` | SSL 검증 비활성화 옵션 | `verifySsl=false` 시 모든 인증서 오류 무시 |
| H3 | `UpdateChecker.cpp` | 경로 순회 | `fileDirectory`에 `..\` 등 포함 가능 |
| H4 | `MupClient.cpp:412` | 정수 부호 문제 | `header.dataLength` 음수 시 캐스팅 문제 |
| H5 | `SignatureVerifier.cpp` | 부분 매칭 허용 | Subject Name 정확 매칭 없이 부분 매칭으로 통과 |

### 🟡 Medium (개선 권장)

| # | 위치 | 문제 | 설명 |
|---|------|------|------|
| M1 | `HashUtil.cpp:36` | 스레드 불안전 | `s_crc32Inited` 경쟁 조건 |
| M2 | `SeedCipher.cpp:285` | PKCS7 검증 취약 | 패딩 값 자체는 검증 안 함 |
| M3 | `main.cpp:181` | 버퍼 오버플로우 | `cmdLine` 버퍼(4096) 초과 가능 |
| M4 | `DllExports.cpp:235` | 버퍼 오버플로우 | `RSGetUpdateServerAddress` 크기 검증 없음 |
| M5 | `UpdateExecutor.cpp` | 원자성 부재 | 업데이트 실패 시 롤백 없음 |

---

## 모듈별 상세 분석

### 1. Config 모듈 (InfoIniParser, UpdateIniParser, PathResolver)

**양호 사항:**
- 입력값 상한 검증 (`MAX_FILES=10000`, `MAX_ACTIONS=100`)
- Modern C++ 스타일 (std::wstring, std::vector)
- INI 인덱싱 규칙 정확 구현 (FILE 0-based, Before/After 1-based)

**문제점:**
- `PathResolver` 경로 검증 미흡 (Path Traversal 가능)
- 긴 경로(4096+ 바이트) 처리 불확실

**점수:** 42/50 (B+)

---

### 2. Network 모듈 (FakeSslLayer, HttpDownloader, MupClient)

**양호 사항:**
- WinHTTP 기반 구현 (WinInet 대체)
- 재시도 로직과 타임아웃 처리
- 진행률 콜백 구현

**문제점:**
- **FakeSslLayer**: 정수 언더플로우 위험, 고정 암호화 값
- **HttpDownloader**: SSL 검증 비활성화 옵션, 경로 검증 부재
- **MupClient**: 버퍼 오버플로우, 정수 부호 문제, 무한 루프 가능성

**점수:** 31/50 (C)

---

### 3. Security 모듈 (SecureBuffer, KeyStore, HashUtil, SeedCipher, SignatureVerifier)

**양호 사항:**
- `SecureBuffer` RAII 패턴, 복사 금지/이동 허용
- `SecureZeroMemory`로 민감 데이터 정리
- BCrypt API 사용 (MD5)
- WinVerifyTrust 결과 실제 확인 (기존 버그 수정)

**문제점:**
- **KeyStore**: 스켈레톤 상태, 실제 키 미이관 (TODO)
- **HashUtil**: `s_crc32Inited` 스레드 불안전
- **SeedCipher**: ECB 모드 사용, PKCS7 검증 취약
- **SignatureVerifier**: 부분 매칭 허용

**점수:** 41/50 (B+)

---

### 4. Update 모듈 (ActionRunner, UpdateChecker, UpdateExecutor)

**양호 사항:**
- 상태 머신 패턴 사용
- 파이프라인 구조 명확
- 9가지 액션 타입 완전 구현

**문제점:**
- **ActionRunner**: 명령 인젝션, 경로 순회
- **UpdateChecker**: 경로 순회, 버전 파싱 검증 미흡
- **UpdateExecutor**: 원자성 부재, 검증 실패 처리 미흡

**점수:** 45/75 (C+)

---

### 5. Exe/Dll 모듈

**양호 사항:**
- 자기 복사 → 재실행 메커니즘 구현
- Win32 다이얼로그 UI (리소스 없이 코드 생성)
- 18개 export 함수 완전 호환
- 35개 테스트 케이스

**문제점:**
- **main.cpp**: `cmdLine` 버퍼 오버플로우 위험
- **DllExports**: `RSGetUpdateServerAddress` 크기 검증 없음
- **CmdLineParser**: 경로 검증 부재

**점수:** 40/50 (B)

---

## Alice 작업 vs 기존 RSAutoUp 분석

| 항목 | 기존 RSAutoUp | Alice 작업 | 개선 여부 |
|------|---------------|------------|-----------|
| 코드 구조 | MFC 기반, 복잡 | Modern C++, 모듈화 | ✅ 개선 |
| 버퍼 오버플로우 | 다수 존재 | 일부 해소, 일부 잔존 | ⚠️ 부분 개선 |
| 보안 취약점 | 260건+ | 약 30건 감소 예상 | ⚠️ 일부 개선 |
| 하드코딩 키 | 존재 | 인프라 구축, 키 미이관 | ⚠️ 미완료 |
| 서명 검증 | WinVerifyTrust 미사용 | 결과 실제 확인 | ✅ 개선 |
| 테스트 | 없음 | 35개 테스트 | ✅ 개선 |

---

## 2차 검토 예정 사항

1. **심층 코드 분석**: Critical/High 항목 상세 분석
2. **보안 취약점 재검증**: 패턴 기반 검색으로 누락 항목 확인
3. **계획 문서 비교**: Alice 계획 vs 실제 구현 일치성

---

*1차 분석 완료: 2026-02-12*