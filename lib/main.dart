import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_project/model/provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'bus_arrival.dart';
import 'bus_route.dart';
import 'restaurant.dart';
import 'setting.dart';
import 'dart:io';
// 페이지 import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = NoCheckCertificateHttpOverrides(); // API 키 권한 받아오기
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
} //main에서 MyApp이란 클래스를 호출한다.

class NoCheckCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


class MyApp extends StatelessWidget {
  //MyApp 클래스 선언
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },

        child: MaterialApp(
          debugShowCheckedModeBanner: false, //오른쪽위 debugBanner 없애기
          title: 'BUSS',
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (BuildContext context) => EvProvider()
              )
            ],
            child: MyPage(),
          ),
        ),
      );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int currentIndex = 0;
  final screens = [
    bus_arrival(), // 버스 도착 페이지
    bus_route(), // 버스 노선 페이지
    restaurant(), // 음식점 및 카페 페이지
    setting(), // 설정 페이지
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        //setState를 써야 바뀐다.
        // navigation 기능
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem( // 페이지 이동 함수
            icon: Icon(Icons.bus_alert),
            label: '실시간 버스',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert_sharp),
            label: '버스 노선',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: '생활 지도',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '정보',
          ),
        ],
      ),
    );
  }
}