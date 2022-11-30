import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
import 'package:test_project/list.dart';

class bus_arrival extends StatefulWidget {
  @override
  State<bus_arrival> createState() => _MyAppState();
}

class _MyAppState extends State<bus_arrival> {
  Future<void> _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {

    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('버스 도착 정보'
          ),
          centerTitle: true, // 중앙 정렬
          elevation: 0.0,
        ),
        body: RefreshIndicator(
            onRefresh: _onRefresh,
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.train_outlined),
                      Text('학교 --> 역',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        child: ListWidget(
                          end: 1,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Icon(Icons.add_business_outlined),
                      ),
                      Text('학교 --> 옥계',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        child: ListWidget(
                          end: 2,
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }
}