import 'package:flutter/material.dart';

class cafe extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<cafe> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카페'),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
      ),
    );
  }
}
