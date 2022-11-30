import 'package:test_project/model/model.dart';
import 'package:test_project/model/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatelessWidget {
  int? end;
  ListWidget({Key? key, required this.end}) : super(key: key);

  late EvProvider _evProvider; // 버스 이름/도착 정보 받아오기

  Widget _makeEvOne(Ev ev) { // 리스트를 컨테이너로 제작
    var arrtemp = ev.arrtime! / 60;
    var buf = arrtemp.toInt();
    return Column(
      children: [
        Expanded(
            child: Column(
              children: [
                // 버스 번호
                Text(
                  ev.bussnum.toString()+" 번",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                // 남은 시간(분)
                Text(
                  buf.toString()+"분 남았습니다.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
        )
      ],
    );
  }

  // 리스트 뷰
  Widget _makeListView(List<Ev> evs) { // 버스 리스트 만들기
    var node = new List<String>.empty(growable: true);
    evs.sort((a, b) => a.arrtime!.compareTo(b.arrtime!));
    if(end == 1){
      node.addAll(["GMB19120", "GMB19320", "GMB51-120", "GMB190-320", "GMB193-220", "GMB891-220", "GMB5720", "GMB5721", "GMB19020", "GMB19220", "GMB19520", "GMB90020", "GMB19620"]);
    }
    else if(end == 2){
      node.addAll(["GMB19310", "GMB19010", "GMB19110", "GMB19510", "GMB40431", "GMB190-110", "GMB19610", "GMB95-210", "GMB95-211", "GMB9710", "GMB190-210", "GMB404-130", "GMB90010", "GMB193-210"]);
    }
    var temp = new List<Ev>.empty(growable: true);

    for(int i  = 0; i < evs.length; i++){
      for(int j = 0; j < node.length; j++){
        if(evs[i].busid == node[j] && temp.length < 3){
          temp.add(evs[i]);
        }
      }
    }
    if(temp.length == 0){
      Map<String, dynamic> prt = {
        "arrtime": '0',
        "routeno": "도착정보가 없습니다.",
        "routeid": "0"
      };
      temp.add(Ev.fromJson(prt));
    }
    temp.sort((a, b) => a.arrtime!.compareTo(b.arrtime!));

    return ListView.separated(
      itemCount: temp.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(height: 40, color: Colors.white, child: _makeEvOne(temp[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      shrinkWrap: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of를 통해 데이터를 접근한다. builder만을 업데이트 하기 위해 listen은 false로 한다.

    _evProvider = Provider.of<EvProvider>(context, listen: false);
    if(end == 1 || end == 2){
      _evProvider.loadEvs("GMB132"); // EvProvider에 loadEvs()의 접근
    }

    return Container(
      child: Consumer<EvProvider>(builder: (context, provider, wideget) {
        // 데이터가 있으면 _makeListView에 데이터를 전달
        if (provider.evs != null && provider.evs.length > 0) {
          return Column(
            children: <Widget>[
              SizedBox(
                  child: _makeListView(provider.evs),
              ),
            ],
          );
        }
        // 데이터가 없으면 "버스정보없음"을 출력
        return Center(
          child: Text("버스정보없음"),
        );
      }
      ),
    );
  }
}