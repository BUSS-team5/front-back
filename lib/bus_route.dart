import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
import 'model/exercise_tile.dart';
import 'package:async/async.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
// 페이지 호출
class bus_route extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// 페이지 생성
class _MyAppState extends State<bus_route> {
  var _buscontroller = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '버스 노선 정보',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(child:
                    TextField(
                      controller: _buscontroller,
                      decoration: InputDecoration(
                        hintText: '노선 검색',
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                     child: Container(
                       color: Colors.grey[100],
                      child: ListView(
                        children: [
                          ExerciseTile(icon: Icons.bus_alert_rounded, exerciseName: '190', icon2: Icons.more_horiz),
                          ExerciseTile(icon: Icons.bus_alert_rounded, exerciseName: '195', icon2: Icons.more_horiz),
                          ExerciseTile(icon: Icons.bus_alert_rounded, exerciseName: '196', icon2: Icons.more_horiz),
                          ExerciseTile(icon: Icons.bus_alert_rounded, exerciseName: '57', icon2: Icons.more_horiz),
                          ExerciseTile(icon: Icons.bus_alert_rounded, exerciseName: '557', icon2: Icons.more_horiz),
                        ],
                      ),
                    ))
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
