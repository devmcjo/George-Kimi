# project002 개발 계획

## 개요
- **프로젝트**: 공학용 계산기 (Engineering Calculator)
- **목표**: Windows 11 실행 가능한 단일 .exe 파일
- **기능**: 사칙연산, 공학용 함수, 20개 히스토리 저장

## 기술 스택
- **언어**: C# (.NET 10)
- **UI**: WPF (Windows Presentation Foundation)
- **배포**: Single-file, Self-contained, x64

## 구현 기능

### 1. 기본 계산
- [x] 사칙연산 (+, -, *, /)
- [x] 소수점 지원
- [x] 부호 변경 (±)
- [x] 백스페이스 (←)
- [x] 전체 지우기 (C)

### 2. 공학용 함수
- [x] 삼각함수 (sin, cos, tan) - 도(degree) 단위
- [x] 로그함수 (log, ln)
- [x] 제곱/제곱근 (x², √, xʸ)
- [x] 역수 (1/x)
- [x] 상수 (π, e)

### 3. 히스토리 기능
- [x] 최근 20개 계산 결과 메모리 저장
- [x] 히스토리 패널 토글 (Hist 버튼)
- [x] 히스토리 선택 시 값 불러오기
- [x] 휘발성 (프로그램 종료 시 초기화)

## 빌드 결과
- **출력**: `EngineeringCalculator.exe`
- **크기**: 약 133MB (self-contained)
- **위치**: `E:\George\Kimi-repo\project002\`

## 테스트 항목
- [x] 정수 계산
- [x] 소수 계산
- [x] 공학용 함수
- [x] 히스토리 저장/불러오기
- [x] Windows 11 실행 확인

## 완료일
2026-02-14
