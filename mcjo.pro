# mcjo.pro - George 비동기 지시사항 채널
# 
# 사용법:
# 1. [INPUT] 섹션의 ">>>" 아래에 지시사항 작성
# 2. Kimi CLI에서 /mcjo 실행
# 3. 처리 완료 후 [HISTORY]에 기록됨

# ============================================
# [INPUT] - 새 지시사항 작성 영역
# ============================================
>>>
다음 내용을 모두 확인하고, 잘못 알고있는 내용이 있다면 바로잡아. 잘못 알고 있는 내용에 대해선 문서(.md)도 수정해.

죠지 메타 인지 폴더 (메인 폴더)
로컬 : E:\George\Kimi
원격 : https://github.com/devmcjo/George-Kimi

개발 산출물 (소스코드 등)
로컬 : E:\George\Kimi-repo
원격 : https://github.com/devmcjo/George-Kimi-repo


신규 개발 혹은 신규 프로젝트 진행 시 
E:\George\Kimi\Project\
경로 하위로 project001, project002, projectNNN 처럼 1씩 늘려가며 프로젝트 관리함.
모든 프로젝트의 개발 산출물은 해당 경로가 아님. 여기는 프로젝트의 메타 인지를 위한 정보들만 보관함.(프로젝트 개발 계획(phase1-description.md 등) 수립 파일 혹은 프로젝트 지시 내용)
mcjo.pro 파일도 projectNNN 폴더 내부에 존재함. mcjo.pro 파일의 우선순위도 project 폴더 내의 mcjo.pro가 우선순위를 가짐.(해당 내용에 대해서는 /mcjo 스킬에 작성되어 있음.)

E:\George\Kimi-repo\project001 폴더 내에 모든 산출물을 저장한다.


# ============================================
# [HISTORY] - 처리 완료된 지시사항 기록
# ============================================
# [HISTORY] 작성 규칙: 최신 항목이 항상 상단에 위치 (역순 정렬)

# [DONE] 테스트 프로젝트 생성 - 경로 정정 완료 (project001 - TestProject)
#   입력: 2026-02-14 21:29:00 | 완료: 2026-02-14 21:30:00 | 소요: ~60초
#   모델: kimi | 토큰: ~추정값
#   프롬프트:
#     테스트 프로젝트 생성해. project001 프로젝트 이름은 TestProject
#   → project001 메타 폴터 생성 완료 (E:\George\Kimi\project\project001\)
#   → README.md, mcjo.pro 생성 완료

# [DONE] 테스트 프로젝트 생성 (project001 - TestProject)
#   입력: 2026-02-14 21:05:11 | 완료: 2026-02-14 21:05:45 | 소요: ~34초
#   모델: kimi | 토큰: ~추정값
#   프롬프트:
#     테스트 프로젝트 생성해. project001 프로젝트 이름은 TestProject
#   → project001 폴터 및 README.md 생성 완료, Git 커밋 완료 ([George] feat: project001 TestProject 생성)
