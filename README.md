# George-Kimi Project

AI 시니어 개발자 **죠지(George)**의 프로젝트 관리 및 메타 정보 저장소입니다.

> **⚠️ 이 저장소는 메타 정보 저장소입니다.**  
> 실제 개발 산출물(소스코드)은 [George-Kimi-repo](https://github.com/devmcjo/George-Kimi-repo)에서 확인하세요.

---

## 📋 저장소 역할

이 저장소는 죠지(George)와의 협업을 관리하기 위한 **메타 정보 저장소**입니다.

| 저장소 | 역할 | URL |
|--------|------|-----|
| **George-Kimi** (본 저장소) | 프로젝트 관리, 문서, 계획서, 설정 | https://github.com/devmcjo/George-Kimi |
| **George-Kimi-repo** | 개발 산출물 (실제 소스코드) | https://github.com/devmcjo/George-Kimi-repo |

---

## 🤖 죠지(George) 소개

죠지는 Kimi AI 기반의 시니어 소프트웨어 개발자 페르소나로, 조명철(mcJo)의 지시 하에 독립적으로 개발 업무를 수행합니다.

### 핵심 역량

- **언어**: C (Win32 API), C++ (MFC, STL, C++11~20), C# (.NET Framework/Core), Python
- **도메인**: Windows 시스템 프로그래밍, 네트워크 프로토콜, 보안, 성능 최적화, 대규모 솔루션 아키텍처
- **특기**: 대규모 코드베이스 분석, 레거시 코드 마이그레이션, 보안 크리티컬 모듈 개발

### 개발 원칙

- 🔒 보안 최우선 (Secure by Design)
- ⚡ 성능 최적화 (하드웨어 자원 최소화)
- 🏗️ 확장 가능한 아키텍처
- 📋 자기 문서화 코드

### 개발 환경 (IDE)

| IDE | 버전 | 용도 |
|-----|------|------|
| Visual Studio | 2022 | Windows 앱, C++, C#, MFC, WPF 개발 |
| Visual Studio Code | 최신 | 경량 프로젝트, Python, 설정 편집 |

> **정책**: 죠지는 위 두 IDE만 사용합니다.

---

## 📁 저장소 구조

```
Kimi/
├── README.md                      # 프로젝트 소개 (본 파일)
├── KIMI.md                        # 🔑 죠지의 핵심 지침
├── george_developer_profile.md    # 죠지 개발자 프로필
├── mcjo.pro                       # 🔔 비동기 지시사항 채널
├── AGENTS.md                      # 🤖 AI 코딩 에이전트 가이드
├── REPOSITORY_STRUCTURE.md        # 저장소 구조 문서
├── memory/                        # 죠지 기억 저장소
│   ├── MEMORY.md                  # 핵심 기억
│   ├── lessons-learned.md         # 교훈 저장소 (22+ 건)
│   └── execution-workflow.md      # 6단계 실행 워크플로우
├── project/                       # 프로젝트별 메타 정보
│   ├── project001/                # 프로젝트 1 메타 정보
│   ├── project002/                # 프로젝트 2 메타 정보
│   └── project003/                # 프로젝트 3 메타 정보
└── .kimi/skills/                  # 죠지 스킬 저장소
    ├── mcjo/                      # /mcjo 스킬
    └── readprofile/               # /readprofile 스킬
```

---

## 🚀 주요 기능

### 1. 비동기 지시사항 채널 (mcjo.pro)

팀 리드는 `mcjo.pro` 파일에 지시사항을 작성하면, 죠지는 `/mcjo` 스킬로 자동으로 처리합니다.

```bash
# Kimi CLI에서 실행
/mcjo
```

### 2. 기억 복원 시스템 (readprofile)

새로운 세션 시작 시 죠지의 모든 기억을 복원합니다.

```bash
# Kimi CLI에서 실행
/readprofile
```

### 3. 이중 저장소 구조

- **메타 저장소** (본 저장소): 문서, 계획서, 설정 관리
- **개발 저장소** ([George-Kimi-repo](https://github.com/devmcjo/George-Kimi-repo)): 실제 소스코드 관리

---

## 📚 핵심 문서

| 문서 | 설명 |
|------|------|
| [KIMI.md](./KIMI.md) | 죠지의 핵심 지침, 권한, 개발 원칙 |
| [george_developer_profile.md](./george_developer_profile.md) | 개발자 프로필, 역량, 업무 프로세스 |
| [AGENTS.md](./AGENTS.md) | AI 코딩 에이전트를 위한 종합 가이드 |
| [memory/lessons-learned.md](./memory/lessons-learned.md) | 22개+ 교훈 저장소 |
| [REPOSITORY_STRUCTURE.md](./REPOSITORY_STRUCTURE.md) | 저장소 구조 및 서브모듈 정보 |

---

## 🔄 작업 프로세스

```
[태스크 할당]
    ↓
[죠지 계획 수립] → WBS 작성
    ↓
[팀 리드 승인]
    ↓
[WBS 단위 실행]
    ↓
[Git 커밋] (push는 팀 리드가 수행)
```

### Git 커밋 규칙

```
[George] {타입}: {설명}
```

**타입**: feat, fix, refactor, style, test, docs, chore

---

## 🌳 프로젝트 목록

| 프로젝트 | 이름 | 설명 | 개발 산출물 |
|----------|------|------|-------------|
| project001 | TestProject | 테스트용 프로젝트 | [Kimi-repo/project001](https://github.com/devmcjo/George-Kimi-repo/tree/main/project001) |
| project002 | Engineering Calculator | 공학용 계산기 | [Kimi-repo/project002](https://github.com/devmcjo/George-Kimi-repo/tree/main/project002) |
| project003 | WeatherApp | 날씨 정보 프로그램 | [Kimi-repo/project003](https://github.com/devmcjo/George-Kimi-repo/tree/main/project003) |

---

## 🔗 관련 저장소

```
┌─────────────────────────────────────┐
│      George-Kimi (메타 저장소)       │
│  - 문서, 계획서, 설정, 교훈 등 관리   │
│  - https://github.com/devmcjo/...   │
└─────────────────┬───────────────────┘
                  │ 서브모듈 연결
                  ▼
┌─────────────────────────────────────┐
│    George-Kimi-repo (코드 저장소)    │
│  - 실제 개발 산출물(소스코드) 관리    │
│  - https://github.com/devmcjo/...   │
└─────────────────────────────────────┘
```

---

_Powered by Kimi 2.5k (Moonshot AI)_  
_Standing on the shoulders of George-Claude 🤝_
