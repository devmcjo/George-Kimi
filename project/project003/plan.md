# project003 개발 계획

## 개요
- **프로젝트**: 날씨 정보 프로그램 (WeatherApp)
- **목표**: 실행 시점부터 일주일간의 날씨 정보를 가져와 보여주는 Windows 프로그램
- **기간**: 미정

## 기술 스택
- **언어**: C# (.NET 6/8)
- **UI**: WPF (Windows Presentation Foundation)
- **API**: 
  - OpenWeatherMap API (묶료 티어) 또는
  - 기상청 단기예보 API
- **HTTP 클라이언트**: System.Net.Http
- **JSON 파싱**: System.Text.Json

## 구현 기능

### 1. UI 설계
- [ ] 도시/지역 입력 필드
- [ ] 7일 날씨 예보 표시 영역
- [ ] 온도, 날씨 아이콘, 습도, 풍속 정보
- [ ] 새로고침 버튼

### 2. API 연동
- [ ] 날씨 API 선택 및 API 키 발급
- [ ] HTTP 요청 구현
- [ ] JSON 응답 파싱
- [ ] 에러 처리 (네트워크 오류 등)

### 3. 데이터 표시
- [ ] 날짜별 날씨 정보 정렬
- [ ] 아이콘 매핑 (맑음, 흐림, 비, 눈 등)
- [ ] 섭씨/화씨 변환 (선택적)

### 4. 빌드 및 배포
- [ ] Release 빌드
- [ ] 단일 .exe 파일 생성
- [ ] Windows 11 호환성 테스트

## API 후보

### OpenWeatherMap
- URL: https://openweathermap.org/
- 묶료 티어: 60 calls/minute
- 5일/3시간 예보 API 제공

### 기상청 단기예보 API
- URL: https://www.data.go.kr/
- 묶료 (API 키 필요)
- 한국 지역 상세 정보

## 완료일
미정
