// main.dart
import 'package:flutter/material.dart';

class bus_route extends StatefulWidget {
  const bus_route({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<bus_route> {

  final List<Map<String, dynamic>> _allUsers = [
    {"id": "190", "HotPlace": "금오공대종점,비산벽산아파트,구미역",},
    {"id": "191", "HotPlace": "Aragon",},
    {"id": "192", "HotPlace": "Bob",},
    {"id": "193", "HotPlace": "Barbara",},
    {"id": "195", "HotPlace": "Candy",},
    {"id": "196", "HotPlace": "Colin",},
    {"id": "900", "HotPlace": "Audra",},
    {"id": "57",  "HotPlace": "Banana",},
    {"id": "557", "HotPlace": "Caversky",},
    {"id": "891-2","HotPlace": "Becky",},
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
      appBar: AppBar(
        title: const Text('버스별 핫플 검색'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value){
                setState(() {
                  _runFilter(value);
                });
              },
              decoration: const InputDecoration(
                  labelText: '검색', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: Colors.blue,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundUsers[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24, color:Colors.white),
                    ),
                    title: Text('추천HotPlace!', style:TextStyle(
                        color:Colors.white
                    )),
                    subtitle: Text(
                        '${_foundUsers[index]['HotPlace']}',style:TextStyle(
                        color:Colors.white
                    )),
                    onTap: (){},
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}