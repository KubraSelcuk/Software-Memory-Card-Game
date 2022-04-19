import 'package:flutter/material.dart';
import 'package:software_memory_card_game/models/users.dart';
import 'database/db_helper.dart';

class ScoreTable extends StatefulWidget {
  //const ScoreTable({Key? key}) : super(key: key);

  @override
  State<ScoreTable> createState() => _ScoreTableState();
}

class _ScoreTableState extends State<ScoreTable> {
  final dbHelper = DatabaseHelper.instance;
  List<Users> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Score Table',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Material(
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: users.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == users.length) {
              return ElevatedButton(
                  child: Text('Upload the Score Table'),
                  onPressed: () {
                    setState(() {
                      _queryAll();
                    });
                  });
            }
            return Container(
              padding: EdgeInsets.all(2),
              height: 50,
              child: ListTile(
                title: Text(
                  'Username: ${users[index].username}',
                ),
                leading: Icon(Icons.flutter_dash),
                trailing: Text("Score: ${users[index].score}"),
              ),
            );
          },
        ),
      ),
    );
  }

  void _queryAll() async {
    final allrows = await dbHelper.queryAllRows();
    users.clear();
    allrows.forEach((row) => users.add(Users.fromMap(row)));
  }
}
