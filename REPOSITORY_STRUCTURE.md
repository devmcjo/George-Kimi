# George-Kimi 저장소 구조

> 생성일: 2026-02-13
> 목적: 죠지(George-Kimi) 관리 프로젝트와 개발 산출물 프로젝트 분리

---

## 📁 전체 구조

```
C:\George-Kimi (메인 저장소 - 죠지 관리)
├── .git/
├── .gitmodules              ← 서브모듈 설정
├── George-Kimi-repo/        ← 서브모듈 (개발 코드 저장소)
│   ├── project004/          ← RVAgent C# Windows Service
│   ├── project005/          ← (향후 프로젝트)
│   └── ...
├── .kimi/                   ← 죠지 설정
├── memory/                  ← 죠지 기억 저장소
├── Onboarding/              ← 온볼딩 자료
└── ...

C:\George-Kimi-repo (로컬 서브모듈 원본)
├── .git/
├── project004/              ← RVAgent 코드 (GitLab 동기화)
└── ...
```

---

## 🔗 서브모듈 정보

| 항목 | 값 |
|------|-----|
| **이름** | George-Kimi-repo |
| **GitLab URL** | https://gitlab.rsupport.com/mcjo/George-Kimi-repo |
| **로컬 경로** | C:\George-Kimi\George-Kimi-repo |
| **visibility** | Private |

---

## 🚀 사용 방법

### 1. 새 프로젝트 시작

```powershell
# 1. George-Kimi-repo로 이동
cd C:\George-Kimi-repo

# 2. 새 프로젝트 폴 더 생성 (projectNNN 규칙)
mkdir project005
cd project005

# 3. 코드 작성...

# 4. GitLab에 푸시
git add .
git commit -m "feat: Initialize project005"
git push origin master
```

### 2. 메인 저장소에서 서브모듈 업데이트

```powershell
# George-Kimi-repo 최신화
cd C:\George-Kimi\George-Kimi-repo
git pull origin master

# 또는 메인 저장소에서
cd C:\George-Kimi
git submodule update --remote
```

### 3. 다른 PC에서 죠지 환경 복제

```powershell
# 1. 메인 저장소 클론
git clone <George-Kimi-url> C:\George-Kimi

# 2. 서브모듈 초기화
cd C:\George-Kimi
git submodule update --init --recursive

# 3. 완료 - 동일 환경 구성됨
```

---

## ⚙️ 서브모듈 설정 방법 (초기 설정 시)

```powershell
cd C:\George-Kimi

# 서브모듈 등록
git submodule add https://gitlab.rsupport.com/mcjo/George-Kimi-repo.git George-Kimi-repo

# 초기화
git submodule update --init --recursive

# 커밋
git add .gitmodules George-Kimi-repo
git commit -m "chore: Add George-Kimi-repo as submodule"
```

---

## 📝 프로젝트 번호 규칙

| 프로젝트 번호 | 내용 | 경로 |
|--------------|------|------|
| project001 | (예약) | George-Kimi-repo/project001/ |
| project002 | (예약) | George-Kimi-repo/project002/ |
| project003 | (예약) | George-Kimi-repo/project003/ |
| project004 | RVAgent C# Windows Service | George-Kimi-repo/project004/ |
| project005+ | (향후 프로젝트) | George-Kimi-repo/projectNNN/ |

---

## 🔄 관리 패턴 (George/George-repo 방식)

이 저장소 구조는 `George/George-repo` 패턴을 따릅니다:

| 저장소 | 역할 | 내용 | 예시 |
|--------|------|------|------|
| **George-Kimi** | 프로젝트 관리 | 문서, 지시사항, 설정 | `project004/mcjo.pro`, `.md` 파일들 |
| **George-Kimi-repo** | 코드 산출물 | 실제 소스코드 | `project004/src/RVAgent/...` |

### 동작 예시

```
[사용자] /mcjo 프로젝트004 새 기능 추가해줘
    ↓
[죠지] C:\George-Kimi\project004\mcjo.pro 읽기 → 지시사항 처리
    ↓
[죠지] C:\George-Kimi\George-Kimi-repo\project004\src\ 에 코드 생성
    ↓
[죠지] GitLab (George-Kimi-repo) 에 소스코드 푸시
```

### 다른 PC에서 환경 복제

```bash
# 1. 메인 저장소 클론 (문서 + 설정)
git clone https://gitlab.rsupport.com/mcjo/George-Kimi.git C:\George-Kimi

# 2. 서브모듈 초기화 (코드 산출물)
cd C:\George-Kimi
git submodule update --init --recursive

# 완료! 동일한 죠지 환경 구성됨
```

## 📝 커밋 규칙 (모든 저장소 공통)

### 적용 대상
- `George-Kimi` (메인 저장소)
- `George-Kimi-repo` (서브모듈 - 코드 저장소)

### 커밋 메시지 형식
```
[Prefix] 타입(#일감번호): 한글 설명 위주

- 세부 내용 한글로 작성
- 영어는 필요시 괄호 안에만 작성
```

### 예시
```bash
# 올바른 예시
[George] feat(#262692): SessionManager 고급 기능 구현 - Day 4 완료

- LoginAsync() - 사용자 로그인 및 세션 생성
- LogoutAsync() - 로그아웃 및 세션 종료
- GenerateAccessTokenAsync() - 액세스 토큰 생성

# 잘못된 예시 (영어 위주)
[George] feat(#262692): Day 4 - SessionManager advanced features
```

### 커밋 타입
| 타입 | 설명 |
|------|------|
| `feat` | 새 기능 |
| `fix` | 버그 수정 |
| `docs` | 문서 |
| `refactor` | 리팩토링 |
| `chore` | 기타 |

## 🔒 보안 주의사항

- **GitLab Personal Access Token**은 절대 저장소에 커밋하지 않음
- 필요 시 환경변수로만 사용 후 즉시 삭제
- Windows Credential Manager에 저장된 인증 정보 활용

---

## 📚 관련 문서

- `KIMI.md` - 죠지 핵심 지식
- `George-Kimi-활용가이드.html` - 상세 가이드
- `.kimi/skills/` - 죠지 스킬 저장소
