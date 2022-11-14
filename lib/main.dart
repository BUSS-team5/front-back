import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_project/model/provider.dart';
import 'dart:async';
import 'package:naver_map_plugin/naver_map_plugin.dart';

import 'package:provider/provider.dart';

import 'bus_arrival.dart';
import 'bus_route.dart';
import 'restaurant.dart';
import 'house.dart';
import 'setting.dart';
import 'dart:io';
// 페이지 import

void main() {
  HttpOverrides.global = NoCheckCertificateHttpOverrides();
  runApp( MyApp());
} //main에서 MyApp이란 클래스를 호출한다.

class NoCheckCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


class MyApp extends StatelessWidget { //MyApp 클래스 선언
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int currentIndex =0;
  final screens = [ //이게 하나하나의 화면이되고, Text등을 사용하거나, dart파일에 있는 class를 넣는다.
    bus_arrival(),
    bus_route(),
    restaurant(),
    house(),
    setting(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() =>currentIndex = index),
        //setState를 써야 바뀐다.
        // navigation 기능
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert),
            label: 'bus arrival',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert_sharp),
            label: 'bus route',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'restaurant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house_outlined),
            label: 'house',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'setting',
          ),
        ],
      ),
    );
  }
}