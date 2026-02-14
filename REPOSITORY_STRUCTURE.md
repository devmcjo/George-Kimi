# George-Kimi ?�?�소 구조

> ?�성?? 2026-02-13
> 목적: 죠�?(George-Kimi) 관�??�로?�트?� 개발 ?�출�??�로?�트 분리

---

## ?�� ?�체 구조

```
E:\George\Kimi (메인 ?�?�소 - 죠�? 관�?
?��??� .git/
?��??� .gitmodules              ???�브모듈 ?�정
?��??� George-Kimi-repo/        ???�브모듈 (개발 코드 ?�?�소)
??  ?��??� project004/          ??RVAgent C# Windows Service
??  ?��??� project005/          ??(?�후 ?�로?�트)
??  ?��??� ...
?��??� .kimi/                   ??죠�? ?�정
?��??� memory/                  ??죠�? 기억 ?�?�소
?��??� Onboarding/              ???�볼???�료
?��??� ...

E:\George\Kimi-repo (로컬 ?�브모듈 ?�본)
?��??� .git/
?��??� project004/              ??RVAgent 코드 (GitLab ?�기??
?��??� ...
```

---

## ?�� ?�브모듈 ?�보

| ??�� | �?|
|------|-----|
| **?�름** | George-Kimi-repo |
| **GitLab URL** | https://gitlab.rsupport.com/mcjo/George-Kimi-repo |
| **로컬 경로** | E:\George\Kimi\George-Kimi-repo |
| **visibility** | Private |

---

## ?? ?�용 방법

### 1. ???�로?�트 ?�작

```powershell
# 1. George-Kimi-repo�??�동
cd E:\George\Kimi-repo

# 2. ???�로?�트 ?????�성 (projectNNN 규칙)
mkdir project005
cd project005

# 3. 코드 ?�성...

# 4. GitLab???�시
git add .
git commit -m "feat: Initialize project005"
git push origin master
```

### 2. 메인 ?�?�소?�서 ?�브모듈 ?�데?�트

```powershell
# George-Kimi-repo 최신??
cd E:\George\Kimi\George-Kimi-repo
git pull origin master

# ?�는 메인 ?�?�소?�서
cd E:\George\Kimi
git submodule update --remote
```

### 3. ?�른 PC?�서 죠�? ?�경 복제

```powershell
# 1. 메인 ?�?�소 ?�론
git clone <George-Kimi-url> E:\George\Kimi

# 2. ?�브모듈 초기??
cd E:\George\Kimi
git submodule update --init --recursive

# 3. ?�료 - ?�일 ?�경 구성??
```

---

## ?�️ ?�브모듈 ?�정 방법 (초기 ?�정 ??

```powershell
cd E:\George\Kimi

# ?�브모듈 ?�록
git submodule add https://gitlab.rsupport.com/mcjo/George-Kimi-repo.git George-Kimi-repo

# 초기??
git submodule update --init --recursive

# 커밋
git add .gitmodules George-Kimi-repo
git commit -m "chore: Add George-Kimi-repo as submodule"
```

---

## ?�� ?�로?�트 번호 규칙

| ?�로?�트 번호 | ?�용 | 경로 |
|--------------|------|------|
| project001 | (?�약) | George-Kimi-repo/project001/ |
| project002 | (?�약) | George-Kimi-repo/project002/ |
| project003 | (?�약) | George-Kimi-repo/project003/ |
| project004 | RVAgent C# Windows Service | George-Kimi-repo/project004/ |
| project005+ | (?�후 ?�로?�트) | George-Kimi-repo/projectNNN/ |

---

## ?�� 관�??�턴 (George/George-repo 방식)

???�?�소 구조??`George/George-repo` ?�턴???�릅?�다:

| ?�?�소 | ??�� | ?�용 | ?�시 |
|--------|------|------|------|
| **George-Kimi** | ?�로?�트 관�?| 문서, 지?�사?? ?�정 | `project004/mcjo.pro`, `.md` ?�일??|
| **George-Kimi-repo** | 코드 ?�출�?| ?�제 ?�스코드 | `project004/src/RVAgent/...` |

### ?�작 ?�시

```
[?�용?? /mcjo ?�로?�트004 ??기능 추�??�줘
    ??
[죠�?] E:\George\Kimi\project004\mcjo.pro ?�기 ??지?�사??처리
    ??
[죠�?] E:\George\Kimi\George-Kimi-repo\project004\src\ ??코드 ?�성
    ??
[죠�?] GitLab (George-Kimi-repo) ???�스코드 ?�시
```

### ?�른 PC?�서 ?�경 복제

```bash
# 1. 메인 ?�?�소 ?�론 (문서 + ?�정)
git clone https://gitlab.rsupport.com/mcjo/George-Kimi.git E:\George\Kimi

# 2. ?�브모듈 초기??(코드 ?�출�?
cd E:\George\Kimi
git submodule update --init --recursive

# ?�료! ?�일??죠�? ?�경 구성??
```

## ?�� 커밋 규칙 (모든 ?�?�소 공통)

### ?�용 ?�??
- `George-Kimi` (메인 ?�?�소)
- `George-Kimi-repo` (?�브모듈 - 코드 ?�?�소)

### 커밋 메시지 ?�식
```
[Prefix] ?�??#?�감번호): ?��? ?�명 ?�주

- ?��? ?�용 ?��?�??�성
- ?�어???�요??괄호 ?�에�??�성
```

### ?�시
```bash
# ?�바�??�시
[George] feat(#262692): SessionManager 고급 기능 구현 - Day 4 ?�료

- LoginAsync() - ?�용??로그??�??�션 ?�성
- LogoutAsync() - 로그?�웃 �??�션 종료
- GenerateAccessTokenAsync() - ?�세???�큰 ?�성

# ?�못???�시 (?�어 ?�주)
[George] feat(#262692): Day 4 - SessionManager advanced features
```

### 커밋 ?�??
| ?�??| ?�명 |
|------|------|
| `feat` | ??기능 |
| `fix` | 버그 ?�정 |
| `docs` | 문서 |
| `refactor` | 리팩?�링 |
| `chore` | 기�? |

## ?�� 보안 주의?�항

- **GitLab Personal Access Token**?� ?��? ?�?�소??커밋?��? ?�음
- ?�요 ???�경변?�로�??�용 ??즉시 ??��
- Windows Credential Manager???�?�된 ?�증 ?�보 ?�용

---

## ?�� 관??문서

- `KIMI.md` - 죠�? ?�심 지??
- `George-Kimi-?�용가?�드.html` - ?�세 가?�드
- `.kimi/skills/` - 죠�? ?�킬 ?�?�소
