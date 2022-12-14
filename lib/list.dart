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
          child: EvFilter(ev),
        )
      ],
    );
  }

  Widget EvFilter(Ev ev){
    if (ev.bussnum == "0"){
      return Column(
        children: [
          Container(
            color: Colors.grey,
            height: 80,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "버스정보가 없습니다.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
      );
    }

    else{
      var arrtemp = ev.arrtime! / 60;
      var buf = arrtemp.toInt();
      return Column(
        children: [
          Expanded(
            child: Container(
              height: 45,
              color: Colors.grey,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  ev.bussnum.toString() + " 번",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
          ),
          Container(
            height: 35,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                buf.toString() + "분 남았습니다.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
      );
    }
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
    else if(end == 3){
      node.addAll(["GMB19320", "GMB51-120", "GMB190-320", "GMB193-220", "GMB891-220", "GMB5720", "GMB5721", "GMB19020", "GMB19220", "GMB19520", "GMB90020", "GMB19620"]);
    }
    else if(end == 4){
      node.addAll(["GMB19010","GMB190-110", "GMB190-310", "GMB190-210","GMB19110","GMB19210","GMB19310","GMB193-210","GMB19510","GMB19610","GMB51-110","GMB55710","GMB5710","GMB90010","GMB520010"]);
    }
    else if(end == 5){
      node.addAll(["GMB19020", "GMB19120", "GMB19320", "GMB193-220", "GMB19520", "GMB90020", "GMB19620","GMB9720","GMB40431","GMB404-130"]);
    }
    else if(end == 6) {
      node.addAll(["GMB19010", "GMB190-110", "GMB190-210", "GMB190-310", "GMB19210", "GMB19310", "GMB193-210", "GMB19510", "GMB19610", "GMB51-110", "GMB55710", "GMB5710", "GMB90010", "GMB520010"]);
    }
    var temp = new List<Ev>.empty(growable: true);

    for(int i  = 0; i < evs.length; i++){
      for(int j = 0; j < node.length; j++){
        if(evs[i].busid == node[j] && temp.length < 4){
          temp.add(evs[i]);
        }
      }
    }
    if(temp.length == 0){
      Map<String, dynamic> prt = {
        "arrtime": '0',
        "routeno": "0",
        "routeid": "0"
      };
      temp.add(Ev.fromJson(prt));
    }
    temp.sort((a, b) => a.arrtime!.compareTo(b.arrtime!));

    return ListView.separated(
      itemCount: temp.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(height: 80, color: Colors.white, child: _makeEvOne(temp[index]));
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
    if(end == 1 || end == 2 || end == 3){
      _evProvider.loadEvs("GMB132"); // EvProvider에 loadEvs()의 접근
    }
    else if(end == 4) {
      _evProvider.loadEvs("GMB80");
    }
    else if(end == 5){
      _evProvider.loadEvs("GMB378");
    }
    else if(end == 6){
      _evProvider.loadEvs("GMB92");
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