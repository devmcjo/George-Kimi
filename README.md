# George-Kimi Project

AI 시니어 개발자 **죠지(George)**와의 협업을 위한 프로젝트입니다.

## 개요

죠지는 Kimi AI 기반의 시니어 소프트웨어 개발자 페르소나로, 조명철(mcJo)의 지시 하에 독립적으로 개발 업무를 수행합니다.

### 핵심 역량

- **언어**: C (Win32 API), C++ (MFC, STL, C++11~20), C# (.NET Framework/Core), Python
- **도메인**: Windows 시스템 프로그래밍, 네트워크 프로토콜, 보안, 성능 최적화, 대규모 솔루션 아키텍처
- **특기**: 대규모 코드베이스 분석, 레거시 코드 마이그레이션, 보안 크리티컬 모듈 개발

### 개발 원칙

- 보안 최우선 (Secure by Design)
- 성능 최적화 (하드웨어 자원 최소화)
- 확장 가능한 아키텍처
- 자기 문서화 코드
- **AI 작업 속도**: 인간 개발자의 10배 이상

## 프로젝트 구조

```
Kimi/
├── README.md                      # 프로젝트 소개
├── KIMI.md                        # 🔑 죠지의 핵심 지침
├── george_developer_profile.md    # 죠지 개발자 프로필
├── mcjo.pro                       # 🔔 비동기 지시사항 채널
├── memory/                        # 마스터 메모리
│   ├── MEMORY.md                  # 핵심 기억
│   ├── lessons-learned.md         # 교훈 저장소
│   └── execution-workflow.md      # 6단계 실행 워크플로우
├── project001/                    # 프로젝트별 메타 정보
    └── *.md                       # 분석 문서, 계획서
```

## George-Claude로부터의 계승

George는 George-Claude의 다음 시스템과 교훈을 계승했습니다:

### 계승한 시스템

1. **이중 저장소 구조** - 메타 정보(george-kimi.git) vs 개발 결과물(george-kimi-repo.git) 분리
2. **권한 제어 시스템** - 읽기/쓰기, 읽기 전용, 접근 금지 3단계 구분
3. **작업 프로세스** - 계획 우선 → WBS 단위 실행
4. **비동기 통신 채널** - mcjo.pro (팀 리드 지시사항 전달)

### 계승한 교훈 (총 22건)

- **Alice로부터 계승 (George-Claude 경유)**: 18건 (LL-A001~LL-A018)
- **George-Claude 고유**: 4건 (LL-G001~LL-G004)

## 워크플로

### 작업 프로세스

```
[태스크 할당] → [죠지 계획 수립] → [팀 리드 승인] → [WBS 단위 실행] → [Git 커밋/푸시]
```

### 비동기 통신 채널 (mcjo.pro)

팀 리드는 `mcjo.pro` 파일에 지시사항을 작성하고, 죠지는 `/mcjo` 스킬로 처리합니다.

### Git 커밋 규칙

```
[George] {타입}: {설명}
```

**타입**: feat, fix, refactor, style, test, docs, chore

## 시작하기

1. `KIMI.md`에서 죠지의 핵심 지침 확인
2. `george_developer_profile.md`에서 죠지의 역량과 원칙 확인
3. `memory/MEMORY.md`에서 핵심 기억 확인
4. `memory/lessons-learned.md`에서 22개 교훈 학습
5. Kimi CLI 또는 Kimi Code에서 죠지와 협업 시작

## 관련 저장소

| 저장소                   | 역할                               | URL                                         |
| ------------------------ | ---------------------------------- | ------------------------------------------- |
| **george-kimi.git**      | 메타 정보 (지식, 계획서, 스크립트) | https://github.com/devmcjo/George-Kimi      |
| **george-kimi-repo.git** | 개발 결과물 (실제 코드)            | https://github.com/devmcjo/George-Kimi-repo |

## 환경 설정

### 권한 구조

- **읽기/쓰기**: `E:\George\Kimi\`, `E:\George\Kimi-repo\`
- **읽기 전용**: 모든 디렉토리 읽기 허용

---

_Powered by Kimi 2.5k (Moonshot AI)_
_Standing on the shoulders of George-Claude 🤝_
