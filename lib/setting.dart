import 'package:flutter/material.dart';

// 페이지 호출
class setting extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// 페이지 생성
class _MyAppState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('정보'),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.grey[800],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
              child: Center(
                child: Image.asset("img/char.jpg", width: 150),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline,
                color:Colors.blue,),
              title: Text('버전 정보'),
              subtitle: Text('1.0.0'),
            ),
            ListTile(
              leading: Icon(
                Icons.phone_android,
                color:Colors.blue,
              ),
              title: Text('사용 설명'),
              trailing: Icon(Icons.keyboard_arrow_right,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page1()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people,
                color:Colors.blue,
              ),
              title: Text('개발자 정보'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.my_library_books_rounded,
                color:Colors.blue,
              ),
              title: Text('오픈소스 정보'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page3()),
                );
              },
            ),
          ],
        ));
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text("사용 설명"),
          leading: const BackButton(
            color: Colors.white,
          )),
      body: Center(
        child: Text("HELLO"),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("개발자 정보"),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Column(
          children:[
            Container(
                padding: EdgeInsets.fromLTRB(40, 20, 30, 20),
                child:
                Column(
                  children: [
                    Card(
                      margin:EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20,16,20,16),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right:20),
                              child:
                              Icon(
                                Icons.person,
                                size: 40,
                                color:Colors.blue,
                              ),
                            ),
                            Column(
                              children:[
                                Row(
                                    children:[
                                      Text("17' 김성태",
                                          style: TextStyle(
                                            fontSize: 20,
                                          )
                                      ),
                                      Text("   컴퓨터공학과"),
                                    ]
                                ),
                                Text("BACKEND"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin:EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20,16,20,16),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right:20),
                              child:
                              Icon(
                                Icons.person,
                                size: 40,
                                color:Colors.blue,
                              ),
                            ),
                            Column(
                              children:[
                                Row(
                                    children:[
                                      Text("17' 박종현",
                                          style: TextStyle(
                                            fontSize: 20,
                                          )
                                      ),
                                      Text("   컴퓨터공학과"),
                                    ]
                                ),
                                Text("BACKEND"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin:EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20,16,20,16),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right:20),
                              child:
                              Icon(
                                Icons.person,
                                size: 40,
                                color:Colors.blue,
                              ),
                            ),
                            Column(
                              children:[
                                Row(
                                    children:[
                                      Text("19' 김하늘",
                                          style: TextStyle(
                                            fontSize: 20,
                                          )
                                      ),
                                      Text("   컴퓨터공학과"),
                                    ]
                                ),
                                Text("FRONTEND"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin:EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20,16,20,16),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right:20),
                              child:
                              Icon(
                                Icons.person,
                                size: 40,
                                color:Colors.blue,
                              ),
                            ),
                            Column(
                              children:[
                                Row(
                                    children:[
                                      Text("20' 나현진",
                                          style: TextStyle(
                                            fontSize: 20,
                                          )
                                      ),
                                      Text("   컴퓨터공학과"),
                                    ]
                                ),
                                Text("BACKEND"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20,16,20,16),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right:20),
                              child:
                              Icon(
                                Icons.person,
                                size: 40,
                                color:Colors.blue,
                              ),
                            ),
                            Column(
                              children:[
                                Row(
                                    children:[
                                      Text("20' 전예지",
                                          style: TextStyle(
                                            fontSize: 20,
                                          )
                                      ),
                                      Text("   컴퓨터공학과"),
                                    ]
                                ),
                                Text("FRONTEND"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            )
          ]
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text("오픈소스 정보"),
          leading: const BackButton(
            color: Colors.white,
          )),
      body: Center(
        child: Text("HELLO"),
      ),
    );
  }
}