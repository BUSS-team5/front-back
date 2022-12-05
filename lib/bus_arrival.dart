import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
import 'package:test_project/list.dart';

class bus_arrival extends StatefulWidget {
  @override
  State<bus_arrival> createState() => _MyAppState();
}

class _MyAppState extends State<bus_arrival> {
  String buffer = '금오공대 ➪ 구미역';
  int idx = 1;
  List<String> dropdownList1 = [
    '금오공대 ➪ 구미역',
    '구미역 ➪ 금오공대',
    '금오공대 ➪ 옥계동(삼구아파트)',
    '옥계동(삼구아파트) ➪ 금오공대',
    '금오공대 ➪ 종합버스터미널',
    '종합버스터미널(오성예식장) ➪ 금오공대',
  ];
  String selectedDropdown1 = '금오공대 ➪ 구미역';
  Map _end_filter = {
    '금오공대 ➪ 구미역' : 1,
    '금오공대 ➪ 옥계동(삼구아파트)' : 2,
    '금오공대 ➪ 종합버스터미널' : 3,
    '구미역 ➪ 금오공대' : 4,
    '옥계동(삼구아파트) ➪ 금오공대' : 5,
    '종합버스터미널(오성예식장) ➪ 금오공대' : 6,
  };

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      buffer = selectedDropdown1;
      idx = _end_filter['${selectedDropdown1}'];
    });
    return null;
  }

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
                  DropdownButton(
                    dropdownColor: Colors.grey[800],
                    value: selectedDropdown1,
                    items: dropdownList1.map((String item) {
                      return DropdownMenuItem<String>(
                        child: Text('$item',
                          style: TextStyle(fontSize: 15, color: Colors.white),),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (dynamic value) {
                      setState(() {
                        selectedDropdown1 = value;
                        buffer = selectedDropdown1;
                        idx = _end_filter['${selectedDropdown1}'];
                      });
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  ),
                  Text('${buffer}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                    child: ListWidget(
                      end: idx, // 학 - 역
                    ),
                  ),
                ]))));
  }
}