import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Todo{
  String address;
  String review;
  double lat;
  double lng;
  String title;

  Todo(this.address, this.review, this.lat, this.lng, this.title);
}

class restaurant extends StatelessWidget {
  final firestore = FirebaseFirestore.instance;

  getData() async{
    var result = await firestore.collection('dataset/구미역/카페').doc('스타벅스 구미점').get();
    print(result.data());
  }
  @override
  Widget build(BuildContext context) {
    var white;
    return Scaffold(
        appBar: AppBar(
          title: Text('음식점 정보'),
          centerTitle: true, // 중앙 정렬
          elevation: 0.0,
        ),
        body:
        Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 150,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: Text(
                  "지도",
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.3,
              maxChildSize: 0.5,
              builder: (BuildContext context, ScrollController scrollController){
                return Container(
                  color: Colors.white,
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index){
                        return ListTile(
                          title : Text('음식점 정보'),
                          onTap: () => _showDialog(context, '사진'),
                        );
                      }),
                );
              },
            ),
          ],
        )
    );
  }

  // API에 있는 showDialog 함수와 이름이 같아서 밑줄(_) 접두사(private 함수)
  void _showDialog(BuildContext context, String text) {
    // 경고창을 보여주는 가장 흔한 방법.
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('선택 완료!'),
            content:
            Text('$text 건물 정보'),
            // 주석으로 막아놓은 actions 매개변수도 확인해 볼 것.
            //actions: <Widget>[
            //     FlatButton(child: Text('확인'), onPressed: () => Navigator.pop(context)),
            // ],
          );
        }
    );
  }
}