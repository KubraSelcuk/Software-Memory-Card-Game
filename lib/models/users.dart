import 'package:software_memory_card_game/database/db_helper.dart';

class Users {
  int? id;
  String? email;
  String? username;
  String? password;
  int? score;

  Users(this.id, this.email, this.username, this.password, this.score);

  Users.fromMap(Map<String?, dynamic> map) {
    id = map['id'];
    email = map['email'];
    username = map['username'];
    password = map['password'];
    score = map['score'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnEmail: email,
      DatabaseHelper.columnUsername: username,
      DatabaseHelper.columnPassword: password,
      DatabaseHelper.comumnScore: score,
    };
  }
}
