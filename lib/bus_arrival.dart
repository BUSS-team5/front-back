import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
import 'package:test_project/list.dart';

class bus_arrival extends StatefulWidget {
  @override
  State<bus_arrival> createState() => _MyAppState();
}

class _MyAppState extends State<bus_arrival> {
  Future<void> _onRefresh() => Future.delayed(Duration(seconds: 1), () {
    return Future<void>.value();
  });

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800], // 배경 색상
        body: RefreshIndicator(
            onRefresh: _onRefresh,
            child: Padding(
                padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '실시간 버스 도착 정보',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  ),
                  Text('금오공대  ➪ 구미역',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                    child: ListWidget(
                      end: 2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text('금오공대  ➪ 옥계동',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    child: ListWidget(
                      end: 2,
                    ),
                  ),
                ]))));
  }
}