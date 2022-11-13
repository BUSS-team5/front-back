import 'package:test_project/model/model.dart';
import 'package:test_project/model/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatelessWidget {
  int? end;
  ListWidget({Key? key, required this.end}) : super(key: key);

  late EvProvider _evProvider; // EvProvider 호출

  Widget _makeEvOne(Ev ev) {
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
  Widget _makeListView(List<Ev> evs) {
    var node = new List<String>.empty(growable: true);
    if(end == 1){
      node.addAll(["191", "193", "51-1", "190-3", "891-2", "57", "190", "192", "195", "900", "196"]);
    }
    else if(end == 2){
      node.addAll(["193", "190", "191", "195", "190-1", "196", "95-2", "97", "190-2", "404-1", "900", "193-2"]);
    }
    var temp = new List<Ev>.empty(growable: true);

    for(int i  = 1; i < evs.length; i++){
      for(int j = 1; j < node.length; j++){
        if(evs[i].bussnum == node[j] && temp.length < 10){
          temp.add(evs[i]);
        }
      }
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