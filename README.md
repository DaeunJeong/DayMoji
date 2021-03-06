# DayMoji
이모지를 사용하여 기록하는 일기 앱

## 배경

- 일기를 재밌고 간단하게 쓸 수 있는 방법이 없을까?
- [이모티콘 퀴즈](https://m.post.naver.com/viewer/postView.nhn?volumeNo=17259598&memberNo=16711396)에서 착안

## 목표

- 데일리 일기를 이모지를 이용해서 작성한다.
- 이모지를 이용하여 일기를 쓸 때 힌트도 함께 작성할 수 있다.
- 이모지로 작성한 일기를 꾹 눌러 힌트를 볼 수 있다.
- 메인 화면에서 월별로 Pagination 하여 데일리 일기를 보여준다.
- 메인 화면에서 보여질 월을 선택할 수 있다.

## 목표가 아닌 것

- 캘린더를 이용하여 날짜 선택이 가능하다.
- 이모지로 작성한 일기를 꾹 눌러 힌트를 볼 때 애니메이션을 제공한다.

## 계획

### 기술 스택

RxSwift, MVVM 아키텍처, Realm

### 화면 구성

일기를 보여줄 화면 MainVC

일기 상세를 보여줄 화면 DetailVC

일기를 작성할 화면 WriteVC
