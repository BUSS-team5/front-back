import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요


class bus_route extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<bus_route> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('버스 노선 정보'),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 40, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '버스 노선 정보',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0),
            ),
          ],
        ),
      ),
    );
  }
}