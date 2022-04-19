import 'dart:async';
import 'package:software_memory_card_game/models/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "userdb.db";
  static final _databaseVersion = 2;
  static final table = 'user_table';
  static final columnId = 'id';
  static final columnEmail = 'email';
  static final columnUsername = 'username';
  static final columnPassword = 'password';
  static final comumnScore = 'score';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $table (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnEmail TEXT NOT NULL,
          $columnUsername TEXT NOT NULL,
          $columnPassword TEXT NOT NULL,
          $comumnScore INTEGER
        )
   ''');
  }

  Future<int> insert(Users user) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'email': user.email,
      'username': user.username,
      'password': user.password,
      'score': user.score
    });
  }

  //tum listeyi dondurme

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  /*Future<List<Users>> getEmployees() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM user_table WHERE ');
    List<Users> users = new List.filled(0, '', growable: true);
    for (int i = 0; i < list.length; i++) {
      users.add(new Users(list[i]["username"], list[i]["password"]));
    }
    print(users.length);
    return users;
  }*/
}
