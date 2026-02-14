# George 저장소 구조

> 생성일: 2026-02-13
> 목적: 죠지(George) 관리 프로젝트와 개발 산출물 프로젝트 분리

---

## 📁 전체 구조

```
E:\George\Kimi (메인 저장소 - 죠지 관리)
├── .git/
├── .gitmodules              ← 서브모듈 설정
├── project/                   ← 프로젝트 메타 정보 폴더 (소문자: project)
│   ├── project001/          ← (최초 프로젝트)
│   ├── project002/          ← (향후 프로젝트)
│   └── ...
├── .kimi/                   ← 죠지 설정
├── memory/                  ← 죠지 기억 저장소
└── ...

E:\George\Kimi\Kimi-repo (개발 산출물 저장소 - 서브모듈)
├── .git/
├── project001/              ← 최초 개발 산출물 (소스코드)
└── ...
```

---

## 🔗 서브모듈 정보

| 항목           | 값                                          |
| -------------- | ------------------------------------------- |
| **이름**       | Kimi-repo                                   |
| **Github URL** | https://github.com/devmcjo/George-Kimi-repo |
| **로컬 경로**  | `E:\George\Kimi\Kimi-repo`                  |
| **visibility** | Public                                      |

---

## 🚀 사용 방법

### 1. 새 프로젝트 시작

```powershell
# 1. Kimi-repo로 이동 (서브모듈)
cd E:\George\Kimi\Kimi-repo

# 2. 새 프로젝트 폴 더 생성 (projectNNN 규칙)
mkdir project005
cd project005

# 3. 코드 작성...

# 4. GitHub에 푸시
git add .
git commit -m "feat: Initialize project005"
git push origin master
```

### 2. 메인 저장소에서 서브모듈 업데이트

```powershell
# Kimi-repo 최신화
cd E:\George\Kimi\Kimi-repo
git pull origin master

# 또는 메인 저장소에서
cd E:\George\Kimi
git submodule update --remote
```

---

## 📝 프로젝트 번호 규칙

| 프로젝트 번호 | 내용            | 경로                    |
| ------------- | --------------- | ----------------------- |
| project001    | (예약)          | `Kimi-repo\project001\` |
| project002    | (예약)          | `Kimi-repo\project002\` |
| project003    | (예약)          | `Kimi-repo\project003\` |
| project004+   | (향후 프로젝트) | `Kimi-repo\projectNNN\` |

---

## 📂 프로젝트 폴터 구조 지침

### 메타 정보 폴터 (`E:\George\Kimi\project\projectNNN\`)

프로젝트 메타 정보를 저장하는 폴터입니다.

| 파일명 | 설명 |
|--------|------|
| `projectNNN-Meta.md` | 프로젝트 개요 및 기본 정보 (README.md 대신 사용) |
| `plan.md` | 개발 계획서 |
| `mcjo.pro` | 프로젝트별 지시사항 채널 |

> **지침**: 메타 정보 파일은 반드시 `projectNNN-Meta.md` 형식으로 작성합니다. `README.md`는 너무 많아서 혼란을 야기할 수 있습니다.

### 개발 산출물 폴터 (`E:\George\Kimi-repo\projectNNN\`)

실제 개발 산출물(소스코드, 실행 파일 등)을 저장하는 폴터입니다.

| 항목 | 설명 |
|------|------|
| 소스코드 | 프로젝트 소스 파일들 |
| `.gitignore` | bin/, obj/, *.exe 등 빌드 산출물 무시 설정 |

> **주의**: 빌드 산출물(bin/, obj/, *.exe 등)은 Git에 커밋하지 않습니다.

---

## 🔄 관리 패턴 (George/George-repo 방식)

이 저장소 구조는 `George/George-repo` 패턴을 따릅니다:

| 저장소               | 역할          | 내용                 | 예시                                |
| -------------------- | ------------- | -------------------- | ----------------------------------- |
| **George-Kimi**      | 프로젝트 관리 | 문서, 지시사항, 설정 | `project001/mcjo.pro`, `.md` 파일들 |
| **George-Kimi-repo** | 코드 산출물   | 실제 소스코드        | `project001/src/(Project Name)/...` |

### 동작 예시

```
[사용자] /mcjo 새 기능 추가해줘
    ↓
[죠지] E:\George\Kimi\mcjo.pro 읽기 → 지시사항 처리(신규 개발 착수 시)
    ↓
[죠지] E:\George\Kimi\Kimi-repo\projectNNN\src\ 에 코드 생성
    ↓
[죠지] GitHub (Kimi-repo) 에 소스코드 푸시
```

## 📚 관련 문서

- `KIMI.md` - 죠지 핵심 지식
- `.kimi/skills/` - 죠지 스킬 저장소
