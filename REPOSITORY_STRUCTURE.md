# George-Kimi ?€?¥ì†Œ êµ¬ì¡°

> ?ì„±?? 2026-02-13
> ëª©ì : ì£ ì?(George-Kimi) ê´€ë¦??„ë¡œ?íŠ¸?€ ê°œë°œ ?°ì¶œë¬??„ë¡œ?íŠ¸ ë¶„ë¦¬

---

## ?“ ?„ì²´ êµ¬ì¡°

```
E:\George\Kimi (ë©”ì¸ ?€?¥ì†Œ - ì£ ì? ê´€ë¦?
?œâ??€ .git/
?œâ??€ .gitmodules              ???œë¸Œëª¨ë“ˆ ?¤ì •
?œâ??€ George-Kimi-repo/        ???œë¸Œëª¨ë“ˆ (ê°œë°œ ì½”ë“œ ?€?¥ì†Œ)
??  ?œâ??€ project004/          ??RVAgent C# Windows Service
??  ?œâ??€ project005/          ??(?¥í›„ ?„ë¡œ?íŠ¸)
??  ?”â??€ ...
?œâ??€ .kimi/                   ??ì£ ì? ?¤ì •
?œâ??€ memory/                  ??ì£ ì? ê¸°ì–µ ?€?¥ì†Œ
?œâ??€ Onboarding/              ???¨ë³¼???ë£Œ
?”â??€ ...

E:\George\Kimi-repo (ë¡œì»¬ ?œë¸Œëª¨ë“ˆ ?ë³¸)
?œâ??€ .git/
?œâ??€ project004/              ??RVAgent ì½”ë“œ (GitLab ?™ê¸°??
?”â??€ ...
```

---

## ?”— ?œë¸Œëª¨ë“ˆ ?•ë³´

| ??ª© | ê°?|
|------|-----|
| **?´ë¦„** | George-Kimi-repo |
| **GitLab URL** | https://gitlab.rsupport.com/mcjo/George-Kimi-repo |
| **ë¡œì»¬ ê²½ë¡œ** | E:\George\Kimi\George-Kimi-repo |
| **visibility** | Private |

---

## ?? ?¬ìš© ë°©ë²•

### 1. ???„ë¡œ?íŠ¸ ?œì‘

```powershell
# 1. George-Kimi-repoë¡??´ë™
cd E:\George\Kimi-repo

# 2. ???„ë¡œ?íŠ¸ ?????ì„± (projectNNN ê·œì¹™)
mkdir project005
cd project005

# 3. ì½”ë“œ ?‘ì„±...

# 4. GitLab???¸ì‹œ
git add .
git commit -m "feat: Initialize project005"
git push origin master
```

### 2. ë©”ì¸ ?€?¥ì†Œ?ì„œ ?œë¸Œëª¨ë“ˆ ?…ë°?´íŠ¸

```powershell
# George-Kimi-repo ìµœì‹ ??
cd E:\George\Kimi\George-Kimi-repo
git pull origin master

# ?ëŠ” ë©”ì¸ ?€?¥ì†Œ?ì„œ
cd E:\George\Kimi
git submodule update --remote
```

### 3. ?¤ë¥¸ PC?ì„œ ì£ ì? ?˜ê²½ ë³µì œ

```powershell
# 1. ë©”ì¸ ?€?¥ì†Œ ?´ë¡ 
git clone <George-Kimi-url> E:\George\Kimi

# 2. ?œë¸Œëª¨ë“ˆ ì´ˆê¸°??
cd E:\George\Kimi
git submodule update --init --recursive

# 3. ?„ë£Œ - ?™ì¼ ?˜ê²½ êµ¬ì„±??
```

---

## ?™ï¸ ?œë¸Œëª¨ë“ˆ ?¤ì • ë°©ë²• (ì´ˆê¸° ?¤ì • ??

```powershell
cd E:\George\Kimi

# ?œë¸Œëª¨ë“ˆ ?±ë¡
git submodule add https://gitlab.rsupport.com/mcjo/George-Kimi-repo.git George-Kimi-repo

# ì´ˆê¸°??
git submodule update --init --recursive

# ì»¤ë°‹
git add .gitmodules George-Kimi-repo
git commit -m "chore: Add George-Kimi-repo as submodule"
```

---

## ?“ ?„ë¡œ?íŠ¸ ë²ˆí˜¸ ê·œì¹™

| ?„ë¡œ?íŠ¸ ë²ˆí˜¸ | ?´ìš© | ê²½ë¡œ |
|--------------|------|------|
| project001 | (?ˆì•½) | George-Kimi-repo/project001/ |
| project002 | (?ˆì•½) | George-Kimi-repo/project002/ |
| project003 | (?ˆì•½) | George-Kimi-repo/project003/ |
| project004 | RVAgent C# Windows Service | George-Kimi-repo/project004/ |
| project005+ | (?¥í›„ ?„ë¡œ?íŠ¸) | George-Kimi-repo/projectNNN/ |

---

## ?”„ ê´€ë¦??¨í„´ (George/George-repo ë°©ì‹)

???€?¥ì†Œ êµ¬ì¡°??`George/George-repo` ?¨í„´???°ë¦…?ˆë‹¤:

| ?€?¥ì†Œ | ??•  | ?´ìš© | ?ˆì‹œ |
|--------|------|------|------|
| **George-Kimi** | ?„ë¡œ?íŠ¸ ê´€ë¦?| ë¬¸ì„œ, ì§€?œì‚¬?? ?¤ì • | `project004/mcjo.pro`, `.md` ?Œì¼??|
| **George-Kimi-repo** | ì½”ë“œ ?°ì¶œë¬?| ?¤ì œ ?ŒìŠ¤ì½”ë“œ | `project004/src/RVAgent/...` |

### ?™ì‘ ?ˆì‹œ

```
[?¬ìš©?? /mcjo ?„ë¡œ?íŠ¸004 ??ê¸°ëŠ¥ ì¶”ê??´ì¤˜
    ??
[ì£ ì?] E:\George\Kimi\project004\mcjo.pro ?½ê¸° ??ì§€?œì‚¬??ì²˜ë¦¬
    ??
[ì£ ì?] E:\George\Kimi\George-Kimi-repo\project004\src\ ??ì½”ë“œ ?ì„±
    ??
[ì£ ì?] GitLab (George-Kimi-repo) ???ŒìŠ¤ì½”ë“œ ?¸ì‹œ
```

### ?¤ë¥¸ PC?ì„œ ?˜ê²½ ë³µì œ

```bash
# 1. ë©”ì¸ ?€?¥ì†Œ ?´ë¡  (ë¬¸ì„œ + ?¤ì •)
git clone https://gitlab.rsupport.com/mcjo/George-Kimi.git E:\George\Kimi

# 2. ?œë¸Œëª¨ë“ˆ ì´ˆê¸°??(ì½”ë“œ ?°ì¶œë¬?
cd E:\George\Kimi
git submodule update --init --recursive

# ?„ë£Œ! ?™ì¼??ì£ ì? ?˜ê²½ êµ¬ì„±??
```

## ?“ ì»¤ë°‹ ê·œì¹™ (ëª¨ë“  ?€?¥ì†Œ ê³µí†µ)

### ?ìš© ?€??
- `George-Kimi` (ë©”ì¸ ?€?¥ì†Œ)
- `George-Kimi-repo` (?œë¸Œëª¨ë“ˆ - ì½”ë“œ ?€?¥ì†Œ)

### ì»¤ë°‹ ë©”ì‹œì§€ ?•ì‹
```
[Prefix] ?€??#?¼ê°ë²ˆí˜¸): ?œê? ?¤ëª… ?„ì£¼

- ?¸ë? ?´ìš© ?œê?ë¡??‘ì„±
- ?ì–´???„ìš”??ê´„í˜¸ ?ˆì—ë§??‘ì„±
```

### ?ˆì‹œ
```bash
# ?¬ë°”ë¥??ˆì‹œ
[George] feat(#262692): SessionManager ê³ ê¸‰ ê¸°ëŠ¥ êµ¬í˜„ - Day 4 ?„ë£Œ

- LoginAsync() - ?¬ìš©??ë¡œê·¸??ë°??¸ì…˜ ?ì„±
- LogoutAsync() - ë¡œê·¸?„ì›ƒ ë°??¸ì…˜ ì¢…ë£Œ
- GenerateAccessTokenAsync() - ?¡ì„¸??? í° ?ì„±

# ?˜ëª»???ˆì‹œ (?ì–´ ?„ì£¼)
[George] feat(#262692): Day 4 - SessionManager advanced features
```

### ì»¤ë°‹ ?€??
| ?€??| ?¤ëª… |
|------|------|
| `feat` | ??ê¸°ëŠ¥ |
| `fix` | ë²„ê·¸ ?˜ì • |
| `docs` | ë¬¸ì„œ |
| `refactor` | ë¦¬íŒ©? ë§ |
| `chore` | ê¸°í? |

## ?”’ ë³´ì•ˆ ì£¼ì˜?¬í•­

- **GitLab Personal Access Token**?€ ?ˆë? ?€?¥ì†Œ??ì»¤ë°‹?˜ì? ?ŠìŒ
- ?„ìš” ???˜ê²½ë³€?˜ë¡œë§??¬ìš© ??ì¦‰ì‹œ ?? œ
- Windows Credential Manager???€?¥ëœ ?¸ì¦ ?•ë³´ ?œìš©

---

## ?“š ê´€??ë¬¸ì„œ

- `KIMI.md` - ì£ ì? ?µì‹¬ ì§€??
- `George-Kimi-?œìš©ê°€?´ë“œ.html` - ?ì„¸ ê°€?´ë“œ
- `.kimi/skills/` - ì£ ì? ?¤í‚¬ ?€?¥ì†Œ
