
import 'package:flutter/material.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("설정"),
              centerTitle: true,
            bottom: new TabBar(
                isScrollable: true,
                indicator: BoxDecoration(
                    color: Colors.black26,
                    borderRadius:  BorderRadius.circular(25.0)
                ) ,
                tabs: [
              new Tab(text: '이용사항', icon: new Icon(Icons.settings)),
              new Tab(text: '문의사항', icon: new Icon(Icons.question_answer)),
          ]),
          ),
          body: new TabBarView(
            children: [
              new ListView(
                children: list,
              ),
              new ListView(
                children: list1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> list = <Widget>[
  new Divider(),
  new ListTile(
    title: new Text('이름 / 주소',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text('리뷰',),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
new Divider(),
new ListTile(
title: new Text('이름 / 주소',
style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
subtitle: new Text('리뷰',),
leading: new Icon(
Icons.restaurant,
color: Colors.blue[500],
),
),
    new Divider(),
    new ListTile(
      title: new Text('이름 / 주소',
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: new Text('리뷰',),
      leading: new Icon(
        Icons.restaurant,
        color: Colors.blue[500],
      ),
    ),
    new Divider(),
    new ListTile(
      title: new Text('이름 / 주소',
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: new Text('리뷰',),
      leading: new Icon(
        Icons.restaurant,
        color: Colors.blue[500],
      ),
    ),
    new Divider(),
    new ListTile(
      title: new Text('이름 / 주소',
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: new Text('리뷰',),
      leading: new Icon(
        Icons.restaurant,
        color: Colors.blue[500],
      ),
    ),
];

List<Widget> list1 = <Widget>[
  new ListTile(
    title: new Text('이름',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text(''),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  new Divider(),
  new ListTile(
    title: new Text('이름',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text(''),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  new Divider(),
  new ListTile(
    title: new Text('이름',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text(''),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  new Divider(),
  new ListTile(
    title: new Text('이름',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text(''),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
];

void main() {
  runApp(new setting());
}