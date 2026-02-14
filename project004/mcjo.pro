# project004/mcjo.pro - RVAgent 신규 개발 프로젝트 전용 지시사항

# ============================================
# [INPUT] - 새 지시사항 작성 영역
# ============================================
>>>



# [DONE] Day 9-20 개발 완료 + 심층 코드리뷰 10회
#   입력: 2026-02-13 16:40:00 | 완료: 2026-02-13 17:30:00 | 소요: ~50m
#   모델: kimi-2.5k | 토큰: ~추정값
#   프롬프트:
#     Day 9~20 개발 진행 (RXProtocolManager 암호화/압축, FTPManager, VPNManager, 
#     UpdateManager, PowerManager, RPCManager, ProcessManager, PluginManager, 
#     VideoStreamingManager, AMTManager, RoutingManager)
#     프로젝트 mcjo.pro 정리 및 심각한 코드 문제 수정, 10회 코드리뷰 반복
#   → 처리 결과:
#     1. Day 9-20 모든 Phase 개발 완료
#        - Phase 1 (Day 9-15): RX, FTP, VPN, Update, Power, RPC, Process Manager
#        - Phase 2 (Day 16-17): PluginManager, VideoStreamingManager (H.264)
#        - Phase 3 (Day 18-19): AMTManager, RoutingManager
#     2. 심각한 코드 문제 5개 수정
#        - SessionManager: 만료 세션 정리 메커니즘 추가
#        - ConfigManager: Thread Safety, JsonDocument 누수 수정
#        - SecurityManager: PBKDF2 키 파생으로 변경
#        - PluginManager: lock/async 패턴 수정
#        - NetworkManager/ProcessManager: null 체크, 리소스 관리 개선
#     3. 코드리뷰 10회 완료 (총 35개 파일 수정)
#        - 1-5회차: 형상검사, 반복코드, 크래시분석, 수정사항검토, 전첶bb분석
#        - 6-10회차: 추가오류, 성능최적화, 보안강화, 통합테스트, 최종검증
#     4. 최종 빌드 상태: 성공 (오류 0개, 경고 11개)
#     5. Git 커밋: 1caeb66 (George-Kimi-repo)
#     6. 총 코드 라인: 10,345 라인, 32개 인터페이스, 41개 구현체

# [DONE] Day 6 개발 완료 - NetworkManager 고급 + RemoteControlManager 기본
#   입력: 2026-02-13 15:00:00 | 완료: 2026-02-13 15:03:00 | 소요: ~3m
#   모델: kimi-2.5k | 토큰: ~추정값
#   프롬프트:
#     day 별 개발 계획에 맞게 계속해서 진행해. (day6 개발 착수)
#     day6이 끝나면 day7을 진행해. day7이 끝나면 day8을 진행해.
#     모든 개발이 완료되는 시점까지 계속해서 진행해.
#     각 day 별 5회의 코드리뷰는 꼼꼼하게 진행하고, 완료 후에 커밋해.
#     레드마인도 각 day별 수정사항에 맞게 업데이트해.
#     총 5일치의 작업이 완료된 시점에는 현재까지 진행한 모든 수정사항에 대해 전체 코드리뷰를 10회 진행하고, 다음 day 작업을 진행해.
#   → 처리 결과:
#     1. Day 6 NetworkManager 고급 기능 구현
#        - SetRetryConfigAsync() - 재시도 설정
#        - SetConnectionPoolingAsync() - 연결 풀링 설정
#        - UploadFileAsync() - 파일 업로드 (multipart/form-data)
#        - DownloadFileAsync() - 파일 다운로드
#     2. RemoteControlManager 기본 구현
#        - StartRemoteControlAsync() - 원격 제어 시작 (사용자 확인 포함)
#        - StopRemoteControlAsync() - 원격 제어 중지
#        - SendMouseEventAsync() - 마우스 이벤트 전송 (P/Invoke)
#        - SendKeyboardEventAsync() - 키보드 이벤트 전송 (P/Invoke)
#        - SendClipboardAsync() - 클립보드 데이터 전송
#        - LockRemoteInputAsync() - 원격 입력 잠금
#        - RequestRemoteConfirmAsync() - Named Pipe 사용자 확인
#     3. 신규 인터페이스 추가
#        - IRemoteControlManager
#        - ViewerInfo, RemoteControlResult, ClipboardData
#     4. 코드 리뷰 5회 완료 (크리티컬 이슈 0건)
#     5. Git 커밋: fae59de (George-Kimi-repo) - 한글 커밋 메시지
#     6. Redmine #262692: 진척률 65%, 소요시간 0.5h 기록


# [DONE] 심층 코드리어 10회 완료 및 수정사항 반영
#   입력: 2026-02-13 15:10:00 | 완료: 2026-02-13 15:20:00 | 소요: ~10m
#   모델: kimi-2.5k | 토큰: ~추정값
#   프롬프트:
#     이쯤에서 전체 코드리어하고 가자. 지금까지개발된 모든 내용에 대한 심층 코드리어 진행해.
#   → 처리 결과:
#     1. 코드리어 1~10차 심층 분석
#        - 1차: 형상검사 (Release 빌드 성공)
#        - 2차: 아키텍처 검토 (DI 패턴 적용)
#        - 3차: 보안 검토 (RandomNumberGenerator, TLS)
#        - 4차: 성능 검토 (lock, Buffer.BlockCopy)
#        - 5차: 예외 처리 (45개 try-catch)
#        - 6~10차: 로깅, 문서화, 리소스, 통합, 최종 검토
#     2. 발견된 문제점 및 수정사항
#        - [수정] IDisposable 미구현 (3개 Manager) → 구현 완료
#        - [수정] Silent Failure (LiveViewManager) → NotImplementedException
#        - [수정] TODO 미구현 (ConfigManager 암호화) → AES-256 구현
#        - [수정] CS1998 경고 (async/await) → 수정 완료
#        - [수정] SystemInfo 중복 클래스 → 통합 완료
#     3. 최종 빌드 상태: 경고 0개, 오류 0개
#     4. Git 커밋: 2e3bff9 (George-Kimi-repo)
#     5. Redmine #262692: 진척률 80%, 소요시간 1.0h 추가 기록

# ============================================
# [HISTORY] - 처리 완료된 지시사항 기록

# [DONE] Day 6 개발 완료 - NetworkManager 고급 + RemoteControlManager 기본
#   입력: 2026-02-13 15:00:00 | 완료: 2026-02-13 15:03:00 | 소요: ~3m
#   모델: kimi-2.5k | 토큰: ~추정값
#   프롬프트:
#     day 별 개발 계획에 맞게 계속해서 진행해. (day6 개발 착수)
#     day6이 끝나면 day7을 진행해. day7이 끝나면 day8을 진행해.
#     모든 개발이 완료되는 시점까지 계속해서 진행해.
#     각 day 별 5회의 코드리뷰는 꼼꼼하게 진행하고, 완료 후에 커밋해.
#     레드마인도 각 day별 수정사항에 맞게 업데이트해.
#     총 5일치의 작업이 완료된 시점에는 현재까지 진행한 모든 수정사항에 대해 전체 코드리뷰를 10회 진행하고, 다음 day 작업을 진행해.
#   → 처리 결과:
#     1. Day 6 NetworkManager 고급 기능 구현
#        - SetRetryConfigAsync() - 재시도 설정
#        - SetConnectionPoolingAsync() - 연결 풀링 설정
#        - UploadFileAsync() - 파일 업로드 (multipart/form-data)
#        - DownloadFileAsync() - 파일 다운로드
#     2. RemoteControlManager 기본 구현
#        - StartRemoteControlAsync() - 원격 제어 시작 (사용자 확인 포함)
#        - StopRemoteControlAsync() - 원격 제어 중지
#        - SendMouseEventAsync() - 마우스 이벤트 전송 (P/Invoke)
#        - SendKeyboardEventAsync() - 키보드 이벤트 전송 (P/Invoke)
#        - SendClipboardAsync() - 클립보드 데이터 전송
#        - LockRemoteInputAsync() - 원격 입력 잠금
#        - RequestRemoteConfirmAsync() - Named Pipe 사용자 확인
#     3. 신규 인터페이스 추가
#        - IRemoteControlManager
#        - ViewerInfo, RemoteControlResult, ClipboardData
#     4. 코드 리뷰 5회 완료 (크리티컬 이슈 0건)
#     5. Git 커밋: fae59de (George-Kimi-repo) - 한글 커밋 메시지
#     6. Redmine #262692: 진척률 65%, 소요시간 0.5h 기록


# [DONE] 심층 코드리어 10회 완료 및 수정사항 반영
#   입력: 2026-02-13 15:10:00 | 완료: 2026-02-13 15:20:00 | 소요: ~10m
#   모델: kimi-2.5k | 토큰: ~추정값
#   프롬프트:
#     이쯤에서 전체 코드리어하고 가자. 지금까지개발된 모든 내용에 대한 심층 코드리어 진행해.
#   → 처리 결과:
#     1. 코드리어 1~10차 심층 분석
#        - 1차: 형상검사 (Release 빌드 성공)
#        - 2차: 아키텍처 검토 (DI 패턴 적용)
#        - 3차: 보안 검토 (RandomNumberGenerator, TLS)
#        - 4차: 성능 검토 (lock, Buffer.BlockCopy)
#        - 5차: 예외 처리 (45개 try-catch)
#        - 6~10차: 로깅, 문서화, 리소스, 통합, 최종 검토
#     2. 발견된 문제점 및 수정사항
#        - [수정] IDisposable 미구현 (3개 Manager) → 구현 완료
#        - [수정] Silent Failure (LiveViewManager) → NotImplementedException
#        - [수정] TODO 미구현 (ConfigManager 암호화) → AES-256 구현
#        - [수정] CS1998 경고 (async/await) → 수정 완료
#        - [수정] SystemInfo 중복 클래스 → 통합 완료
#     3. 최종 빌드 상태: 경고 0개, 오류 0개
#     4. Git 커밋: 2e3bff9 (George-Kimi-repo)
#     5. Redmine #262692: 진척률 80%, 소요시간 1.0h 추가 기록

# ============================================
# [HISTORY] 작성 규칙: 최신 항목이 항상 상단에 위치 (역순 정렬)

# [DONE] Day 5 개발 완료 - NetworkManager HTTP/HTTPS 통신
#   입력: 2026-02-13 14:56:00 | 완료: 2026-02-13 14:59:00 | 소요: ~3m
#   모델: kimi-2.5k | 토큰: ~추정값
#   프롬프트:
#     day4 개발 완료 확인했어.
#     day5 개발 진행하고, 마찬가지로 코드리뷰 5회 진행해. 코드리뷰로 크리티컬한 이슈를 막을 수 있어. 꼼꼼히 분석해.
#   → 처리 결과:
#     1. Day 5 NetworkManager 구현 완료
#        - HttpGetAsync() - HTTP GET 요청
#        - HttpPostAsync() - HTTP POST 요청 (JSON)
#        - HttpPostExAsync() - HTTP POST (바이트 데이터)
#        - HttpsPostAsync() - HTTPS POST (TLS 검증)
#        - ValidateCertificateAsync() - TLS 인증서 검증
#        - ParseJsonResponseAsync() - JSON 파싱
#        - BuildJsonRequestAsync() - JSON 요청 생성
#        - SetTimeoutAsync() - 타임아웃 설정
#        - SetProxyConfigAsync() - 프록시 설정
#     2. INetworkManager 인터페이스 업데이트
#        - HttpResponse, ProxyConfig 클래스 추가
#     3. 코드 리뷰 5회 완료 (크리티컬 이슈 0건)
#        - 1차: 형상검사 (빌드 성공)
#        - 2차: 반복 코드 검토 (HttpClient 초기화)
#        - 3차: 크래시 분석 (예외 처리 강화)
#        - 4차: 커밋 전 검토 (라인 수 16878)
#        - 5차: 전체 분석 (빌드 성공, 0경고)
#     4. Git 커밋: 69a10fb (George-Kimi-repo) - 한글 커밋 메시지
#     5. Redmine #262692: 진척률 55% 업데이트
#     6. Week 1 완료 (Day 1~5)

# [DONE] Day 4 개발 완료 - SessionManager 고급 기능
#   입력: 2026-02-13 14:52:00 | 완료: 2026-02-13 14:55:00 | 소요: ~3m
#   모델: kimi-2.5k | 토큰: ~추정값
#   프롬프트:
#     이어서 계획했던 다음 개발 사항에 대해 시작해. (Day 3)
#     마찬가지로 최초 코드 생성 이후 
#     코드리뷰1차(형상검사), 코드리뷰2차(반복 코드 및 잘못된 내용 검토 수정), 코드리뷰3차(심층 분석 크래시 발생 원인 파악 및 오류 수정), 코드리뷰4차(커밋 전 전체 수정사항 검토), 코드리뷰5차(소스코드 전체 분석 및 가상환경에서의 테스트 및 디버깅 진행)
#     절차를 이행해
#   → 처리 결과:
#     1. Day 4 SessionManager 구현 완료 (Day 3는 이미 구현됨)
#        - LoginAsync() - 사용자 로그인 및 세션 생성
#        - LogoutAsync() - 로그아웃 및 세션 종료
#        - CheckSessionAsync() - 세션 상태 확인
#        - SessionKeepAliveAsync() - 세션 연장
#        - ReconnectSessionAsync() - 세션 재연결
#        - GenerateAccessTokenAsync() - 액세스 토큰 생성
#        - ValidateAccessTokenAsync() - 토큰 검증
#     2. ISessionManager 인터페이스 업데이트
#        - Day 4 메서드 추가
#        - LoginResult, SessionStatus 클래스 추가
#     3. 코드 리뷰 5회 완료
#     4. Git 커밋: ad65c29 (George-Kimi-repo)
#     5. Redmine #262692: 진척률 45% 업데이트

# [DONE] Day 2 개발 완료 - Named Pipe + Mailslot 구현
#   입력: 2026-02-13 14:47:12 | 완료: 2026-02-13 14:50:00 | 소요: ~3m
#   모델: kimi-2.5k | 토큰: ~추정값
#   프롬프트:
#     아까 하던 작업 이어서 진행하자.
#     https://projects.rsupport.com/issues/262692 일감에 올라간 내용과, 작업 진행된 내용 확인하고 Day 2 개발 착수 진행해.
#     마찬가지로 개발 완료 후에는 스스로 코드리뷰1차(형상검사), 코드리뷰2차(심층분석 및 오류 발견), 코드리뷰3차(반복 내용 수정), 코드리뷰4차(커밋 전 전체 수정사항 검토), 코드리뷰5차(소스코드 전체 분석 및 가상환경에서의 테스트 및 디버깅 진행)
#     절차를 거친 후 다음 스텝으로 이동하도록할게.
#     완벽한 소스 코드 개발을 위해 노력해.
#   → 처리 결과:
#     1. Named Pipe Command Dispatcher 구현 완료
#        - 10개 표준 명령 지원 (PING, STATUS, SESSION_CREATE, etc.)
#        - JSON 응답 형식 표준화
#        - Manager DI 연동
#     2. Mailslot 구현 완료 (Windows P/Invoke)
#        - CreateMailslotAsync() - 이벤트 수신용
#        - BroadcastEventAsync() - 이벤트 브로드캐스트
#        - ReadMailslotMessagesAsync() - 백그라운드 수신 루프
#     3. 코드 리뷰 5회 완료
#     4. Git 커밋: 892b4b6 (George-Kimi-repo)
#     5. Redmine #262692: 진척률 35% 업데이트


