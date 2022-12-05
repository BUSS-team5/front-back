# test_project

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 활용 방도

해당 앱은 금오공과대학교 학생들을 대상으로 만들어진 앱입니다.
이용 대상인 학생들에게 주요 이동지의 버스 도착 정보, 버스 노선별 주요 핫플레이스, 핫플레이스별 주변 인프라를 안내해 줍니다.

## 사용 오픈소스 정보

오픈API
- Naver Dynamic Map
- 국토교통부_(TAGO)_버스도착정보

사용 패키지
- package:http/http.dart
- package:xml2json/xml2json.dart
- package:naver_map_plugin/naver_map_plugin.dart
- package:cloud_firestore/cloud_firestore.dart
- package:firebase_core/firebase_core.dart
- firebase_options.dart
- package:flutter/cupertino.dart
- package:toggle_switch/toggle_switch.dart
- package:provider/provider.dart

패키지 별 버전 정보
- cupertino_icons: ^1.0.2
- firebase_core: ^2.0.0
- cloud_firestore: ^4.0.1
- http: ^0.13.5
- xml2json: ^5.3.2
- provider: ^6.0.1
- naver_map_plugin:
  git: https://github.com/LBSTECH/naver_map_plugin.git
- pull_to_refresh: ^2.0.0
- toggle_switch: ^2.0.1

##페이지별 기능

bus_arrival
- 금오공대 <-> 옥계, 터미널, 구미역을 종점으로 하는 버스가 얼마정도의 시간이 남았는지 알려준다.
- 최대 4개의 버스 노선이 화면에 노출되며 도착 시간이 빠른 순으로 정렬된다.

bus_route
- 버스 번호 별 거쳐가는 핫플레이스를 알려준다.
- 기본 화면은 상단의 TextField가 비어있으며 모든 버스 노선의 핫플레이스가 ListTile로 출력된다.
- 사용자가 TextField에 버스 노선을 검색하면 해당 노선을 제외한 나머지 노선의 핫플레이스를 출력한 ListTile이 사라진다.

restaurant
- 버스 정류장 중 유동인구가 많은 정류장 근처의 음식점,카페,부동산 정보를 알려준다.
- 사용자는 DropdownButton에서 핫플레이스를 선택할 수 있으며 ToggleSwitch에서 카페, 음식점, 부동산 정보를 선택하여 화면에 출력할 마커를 변경할 수 있다.
- 추가적으로 카페, 음식점의 마커는 반경 100m의 경우 주황색, 반경 300m의 경우 초록색, 반경 500m의 경우 파란색으로 출력된다.
- 초기 화면의 경우 구미역의 음식점 정보에 대한 마커가 화면에 출력된다.

setting
- 버전 정보, 사용 설명, 개발자 정보, 오픈 소스 정보를 알려준다.