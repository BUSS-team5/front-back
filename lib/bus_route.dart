// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const bus_route());
}

class bus_route extends StatelessWidget {
  const bus_route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Map<String, dynamic>> _allUsers = [
    {"id": "190", "name": "구미역 / 오성예식장앞 / 신평시장 / 비산벽산아파트 / 금오공대종점"},
    {"id": "190-1", "name": "구미역 / 오성예식장앞 / 신평시장 / 비산벽산아파트 / 삼구아파트  "},
    {"id": "190-2", "name": "구미역 / 오성예식장앞 / 신평시장 / 비산벽산아파트 / 금오공대종점 / 삼구아파트"},
    {"id": "190-3", "name": "구미역 / 오성예식장앞 / 신평시장 / 비산벽산아파트 / 금오공대종점"},
    {"id": "191", "name": "구미역 / 신평시장 / 비산벽산아파트 / 금오공대종점 / 삼구아파트"},
    {"id": "192", "name": "구미역 / 오성예식장앞 / 금오공대종점 / 옥계중학교 / 롯데마트"},
    {"id": "193", "name": "구미역 / 오성예식장앞 / 신평시장 / 금오공대종점 / 옥계중학교 / 삼구아파트"},
    {"id": "193-2", "name": "구미역 / 오성예식장앞 / 신평시장 / 금오공대종점 / 옥계중학교 / 삼구아파트"},
    {"id": "195", "name": "구미역 / 오성예식장앞 / 금오공대종점 / 옥계중학교 / 삼구아파트 / 롯데마트"},
    {"id": "196", "name": "구미역 / 오성예식장앞 / 신평시장 / 비산벽산아파트 / 금오공대종점 / 옥계중학교 / 삼구아파트"},
    {"id": "51-1", "name": "구미역 / 오성예식장앞 / 신평시장 / 비산벽산아파트 / 금오공대종점"},
    {"id": "5200", "name": "구미역 / 오성예식장앞 / 신평시장 / 금오공대종점"},
    {"id": "557", "name": "구미역 / 오성예식장앞 / 신평시장 / 비산벽산아파트 / 금오공대종점"},
    {"id": "57", "name": "구미역 / 오성예식장앞 / 신평시장 / 비산벽산아파트 / 금오공대종점"},
    {"id": "900", "name": "구미역 / 금오공대종점 / 옥계중학교 / 삼구아파트"},
    {"id": "404", "name": "금오공대종점 / 옥계중학교 / 삼구아파트"},
    {"id": "404-1", "name": "금오공대종점 / 옥계중학교 / 삼구아파트"},
    {"id": "97", "name": "금오공대종점 / 옥계중학교 / 삼구아파트"},
    {"id": "95-2", "name": "옥계중학교 / 금오공대종점 / 삼구아파트"},
    {"id": "891-2", "name": "옥계중학교 / 금오공대종점 / 롯데마트 / 구미역"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {

    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["id"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundUsers = results;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,60,20,20),
        child: Column(
          children: [
            Text(
              '핫플레이스 노선 정보',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value){
                setState(() {
                  _runFilter(value);
                });
              },
              decoration: const InputDecoration(
                  labelText: '버스 번호를 입력하세요.', suffixIcon: Icon(Icons.search)),
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: Colors.black38,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundUsers[index]["id"].toString(),
                      style: const TextStyle(fontSize: 20, color:Colors.white),
                    ),
                    title: Text(_foundUsers[index]['name'],
                        style:TextStyle(
                          fontSize: 14,
                          color:Colors.white,
                        )),
                  ),
                ),
              )
                  : const Text(
                '정보가 없습니다.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}