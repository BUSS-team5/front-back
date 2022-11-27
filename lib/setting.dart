
import 'package:flutter/material.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 3,
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
              new Tab(text: '버전정보', icon: new Icon(Icons.question_answer)),
                  new Tab(text: '개발자 정보', icon: new Icon(Icons.hail)),
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
              new ListView(
                children: list2,
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
    title: new Text('이용사항',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
    subtitle: new Text('정보',),
    /* leading: new Icon(
      Icons.
      color: Colors.blue[500], */
    ),

  new Divider(),
  new ListTile(
    title: new Text('이용사항',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
    subtitle: new Text('정보',),
    /* leading: new Icon(
      Icons.
      color: Colors.blue[500], */
  ),
];

List<Widget> list1 = <Widget>[
new Divider(),
new ListTile(
title: new Text('버전 정보',
style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
subtitle: new Text('정보',),
/* leading: new Icon(
      Icons.
      color: Colors.blue[500], */
),

new Divider(),
new ListTile(
title: new Text('버전 정보',
style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
subtitle: new Text('정보',),
/* leading: new Icon(
      Icons.
      color: Colors.blue[500], */
),
];
List<Widget> list2 = <Widget>[
  new Divider(),
  new ListTile(
    title: new Text('개발자 정보',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
    subtitle: new Text('정보',),
    /* leading: new Icon(
      Icons.
      color: Colors.blue[500], */
  ),

  new Divider(),
  new ListTile(
    title: new Text('개발자 정보',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
    subtitle: new Text('정보',),
    /* leading: new Icon(
      Icons.
      color: Colors.blue[500], */
  ),
];

void main() {
  runApp(new setting());
}