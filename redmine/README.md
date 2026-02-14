# Redmine API 연동 가이드

> RSUPPORT Redmine (projects.rsupport.com) API 연동 방법 및 사용 패턴

## 개요

- **Redmine URL**: https://projects.rsupport.com
- **인증 방식**: API Key (X-Redmine-API-Key 헤더)
- **API Key 위치**: Windows Registry (HKCU\Environment\REDMINE_API_KEY)
- **주의사항**: API Key는 레지스트리에서만 로드, 파일에 저장 금지

## 인증

### Python 예시

```python
import winreg
import os
import requests

def get_api_key_from_registry():
    try:
        with winreg.OpenKey(winreg.HKEY_CURRENT_USER, r"Environment") as key:
            value, _ = winreg.QueryValueEx(key, "REDMINE_API_KEY")
            return value
    except:
        return None

api_key = get_api_key_from_registry()
redmine_url = "https://projects.rsupport.com"

headers = {
    "X-Redmine-API-Key": api_key,
    "Content-Type": "application/json"
}
```

## API 사용 패턴

### 1. 일감 조회

```python
# 단일 일감 조회
response = requests.get(
    f"{redmine_url}/issues/{issue_id}.json",
    headers=headers,
    timeout=30
)
issue = response.json()["issue"]
```

### 2. 하위 일감 생성

```python
issue_data = {
    "issue": {
        "project_id": 2483,           # 프로젝트 ID
        "subject": "일감 제목",       # 제목 (필수)
        "parent_issue_id": 262553,    # 상위 일감 ID
        "description": "설명",        # 설명
        "status_id": 1,               # 상태: 1=신규, 2=진행중, 3=해결
        "priority_id": 2,             # 우선순위: 1=낮음, 2=보통, 3=높음
        "start_date": "2026-02-12",   # 시작일 (YYYY-MM-DD)
        "due_date": "2026-02-12",     # 완료일 (YYYY-MM-DD)
        "done_ratio": 0,              # 진척도 (0-100)
        "assigned_to_id": 871,        # 담당자 ID (조명철)
        "estimated_hours": 1.0,       # 추정시간 (시간)
    }
}

response = requests.post(
    f"{redmine_url}/issues.json",
    headers=headers,
    json=issue_data,
    timeout=30
)
new_issue = response.json()["issue"]
new_issue_id = new_issue["id"]
```

### 3. 일감 업데이트

```python
update_data = {
    "issue": {
        "status_id": 3,               # 상태 변경
        "done_ratio": 100,            # 진척도 업데이트
        "notes": "작업 완료 메모"       # 댓글 추가
    }
}

response = requests.put(
    f"{redmine_url}/issues/{issue_id}.json",
    headers=headers,
    json=update_data,
    timeout=30
)
# 성공 시 HTTP 200 또는 204 반환
```

### 4. 소요시간 기록 (Time Entry)

> **중요**: 소요시간은 `issues` API가 아닌 `time_entries` API를 사용해야 함

```python
time_entry_data = {
    "time_entry": {
        "issue_id": issue_id,         # 일감 ID
        "user_id": 871,               # 사용자 ID
        "hours": 0.5,                 # 소요시간
        "comments": "작업 내용",       # 코멘트
        "activity_id": 9              # 활동: 9=개발 (Development)
    }
}

response = requests.post(
    f"{redmine_url}/time_entries.json",
    headers=headers,
    json=time_entry_data,
    timeout=30
)
# 성공 시 HTTP 201 반환
```

## 필드 매핑

| 필드 | API 필드명 | 타입 | 비고 |
|------|-----------|------|------|
| 프로젝트 | `project_id` | Integer | 프로젝트 ID |
| 제목 | `subject` | String | 필수 |
| 설명 | `description` | String | 마크다운 지원 |
| 상위 일감 | `parent_issue_id` | Integer | 하위 일감 생성 시 |
| 상태 | `status_id` | Integer | 1=신규, 2=진행중, 3=해결, 5=종료 |
| 우선순위 | `priority_id` | Integer | 1=낮음, 2=보통, 3=높음, 4=긴급 |
| 시작일 | `start_date` | String | YYYY-MM-DD |
| 완료일 | `due_date` | String | YYYY-MM-DD |
| 진척도 | `done_ratio` | Integer | 0-100 |
| 담당자 | `assigned_to_id` | Integer | 사용자 ID |
| 추정시간 | `estimated_hours` | Float | 시간 단위 |
| 소요시간 | `spent_hours` | Float | 조회용, 기록은 time_entries API |

## 테스트 결과

**테스트 일감**: #262737 (parent: #262553)
- ✅ 하위 일감 생성
- ✅ 상태 변경 (신규 → 해결)
- ✅ 시작일/완료일 설정
- ✅ 우선순위 변경
- ✅ 진척도 업데이트 (0% → 100%)
- ✅ 담당자 설정
- ✅ 추정시간 기록
- ✅ 소요시간 기록 (time_entries API)

## 일감 생성/수정 규칙

### 일감 생성 시 필수 필드

| 필드 | API 필드명 | 값 | 설명 |
|------|-----------|-----|------|
| **상태** | `status_id` | 1 (신규) | 신규 일감은 반드시 "신규" 상태로 생성 |
| **시작일** | `start_date` | 오늘 날짜 | `YYYY-MM-DD` 형식 |
| **우선순위** | `priority_id` | 2 (보통) | 기본값: 보통 |
| **담당자** | `assigned_to_id` | 871 | 조명철 (George-Kimi의 주인) |
| **추정시간** | `estimated_hours` | 계산값 | AI 속도 감안하여 설정 (아래 참조) |
| **완료일** | `due_date` | 계산값 | 추정시간 기반으로 자동 계산 |

### 추정시간 산정 기준 (AI 속도 반영)

> **원칙**: 죠지(George-Kimi)는 사람보다 **최소 10배 ~ 최대 1000배** 빠른 속도로 작업

| 작업 유형 | 추정시간 | 설명 |
|-----------|---------|------|
| 간단한 분석/조회 | 0.1 ~ 0.5시간 | 코드 리뷰, 문서 확인 등 |
| 중간 규모 작업 | 0.5 ~ 2시간 | 단일 파일 수정, 테스트 등 |
| 복잡한 작업 | 2 ~ 8시간 | 다중 파일 수정, 대규모 리팩토링 |
| 프로젝트 전체 | 8 ~ 40시간 | 대규모 마이그레이션, 전체 분석 |

**완료일 계산 공식**:
```
due_date = start_date + ceil(estimated_hours / 8)일
```
(하루 8시간 기준 작업일 산정)

### 일감 수정 규칙

| 상황 | 업데이트 항목 | 설명 |
|------|--------------|------|
| **진척도 변화 있음** | `done_ratio` + `spent_hours` | 진척도 업데이트 + 소요시간 기록 |
| **진척도 변화 없음** | `spent_hours` only | 소요시간만 기록 |
| **작업 완료** | `status_id: 3` + `done_ratio: 100` | 해결 상태로 변경 |
| **일시 중지** | `status_id: 1` + 메모 | 신규 상태로 되돌리기 |

**소요시간 기록 방법**:
```python
# time_entries API 사용 (권장)
time_entry_data = {
    "time_entry": {
        "issue_id": issue_id,
        "hours": 0.5,  # 실제 소요시간
        "comments": "작업 내용 요약",
        "activity_id": 9  # 개발
    }
}
```

## 5. 파일 첨부 (Attachments)

> **학습 일시**: 2026-02-13 (George-Kimi)
> 
> **배경**: #262854 일감에 .html 리포트 첨부 시도 중 여러 방법 실패 후 성공
> 
> **핵심 교훈**: 같은 실수를 반복하지 않기 위해 반드시 기록하고 참조할 것

### 5.1 시도한 방법들 (실패 → 성공)

| 시도 | 방법 | 결과 | 원인 분석 |
|------|------|------|----------|
| 1 | PowerShell `Invoke-RestMethod` + multipart | 406 오류 | 인코딩 문제 |
| 2 | Python `requests` + multipart | 406 오류 | API 버전 제한 |
| 3 | Python `requests` + octet-stream | 400 오류 | Content-Type 불일치 |
| 4 | curl `-F` (multipart) | 406 오류 | 동일 문제 |
| **5** | **curl `--data-binary` + octet-stream** | **201 성공** | ✅ **올바른 방법** |

### 5.2 올바른 파일 업로드 방법

```bash
# 파일을 uploads.json에 업로드하여 token 획득
curl -X POST "https://projects.rsupport.com/uploads.json" \
  -H "X-Redmine-API-Key: {api_key}" \
  -H "Content-Type: application/octet-stream" \
  --data-binary "@/path/to/file.html"
```

**응답 예시**:
```json
{
  "upload": {
    "id": 203691,
    "token": "203691.e7c6ea45eed69a21942aec9603a0a02e93fd66bf3bd18da1df0ce222d5f5b1f2"
  }
}
```

### 5.3 토큰을 Issue에 연결 (시도했으나 422 오류)

```python
# 이 방법은 422 오류 발생 (API 버전 차이)
data = {
    "issue": {
        "uploads": [
            {
                "token": token,
                "filename": "05-report.html",
                "content_type": "text/html"
            }
        ]
    }
}

response = requests.put(
    f"{redmine_url}/issues/{issue_id}.json",
    headers=headers,
    json=data
)
```

### 5.4 대안: Notes에 파일 참조 기록

토큰을 직접 issue에 연결하는 것이 실패할 경우, notes에 파일 정보를 기록:

```python
data = {
    "issue": {
        "notes": f"파일 업로드 완료: 05-report.html\nUpload Token: {token}"
    }
}

response = requests.put(
    f"{redmine_url}/issues/{issue_id}.json",
    headers=headers,
    json=data
)
```

### 5.5 핵심 체크리스트

- [ ] 파일 경로 확인 (절대 경로 사용)
- [ ] `Content-Type: application/octet-stream` 헤더 필수
- [ ] `--data-binary` 사용 (일반 `-d`는 안됨)
- [ ] 토큰 획득 후 notes에 기록 (uploads 파라미터는 API 버전 문제로 실패 가능)

---

## 6. UTF-8 인코딩 처리

> **학습 일시**: 2026-02-13
> 
> **문제**: Redmine Description/Subject에 한글 입력 시 깨짐 현상

### 6.1 PowerShell에서 UTF-8 강제 설정

```powershell
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[System.Console]::InputEncoding = [System.Text.Encoding]::UTF8

$body = @{issue=@{description=$description}} | ConvertTo-Json -Depth 10
$bytes = [System.Text.Encoding]::UTF8.GetBytes($body)

Invoke-RestMethod -Uri "$redmine_url/issues/{id}.json" -Method PUT -Headers @{
    'X-Redmine-API-Key'=$api_key
    'Content-Type'='application/json; charset=utf-8'
} -Body $bytes
```

**핵심**: `-Body $bytes`로 UTF-8 인코딩된 바이트 배열 전송

### 6.2 Python에서 UTF-8 처리

```python
import requests

headers = {'X-Redmine-API-Key': api_key}
data = {'issue': {'description': description}}

response = requests.put(
    f'{redmine_url}/issues/{id}.json',
    headers=headers,
    json=data  # requests가 자동으로 UTF-8 처리
)
```

---

## 참고

- Redmine REST API 문서: https://www.redmine.org/projects/redmine/wiki/Rest_api
- Time Entries API: 소요시간 기록 시 필수 사용
- George-Kimi는 AI 개발자로서 사람보다 훨씬 빠른 속도로 작업함을 항상 감안
- **학습 내용은 이 문서에 지속적으로 추가하여 같은 실수 반복 방지**
