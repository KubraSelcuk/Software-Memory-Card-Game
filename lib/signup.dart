import 'package:flutter/material.dart';
import 'package:software_memory_card_game/database/db_helper.dart';
import 'package:software_memory_card_game/login_page.dart';

import 'models/users.dart';

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  final dbHelper = DatabaseHelper.instance;
  final GlobalKey<ScaffoldState> _ScaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _showMessage(String message) {
    // ignore: deprecated_member_use
    _ScaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _ScaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: AssetImage('assets/cards/brain.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.purple,
                        ),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email gir";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        labelText: "Username",
                        labelStyle: TextStyle(
                          color: Colors.purple,
                        ),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Type your Username";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //SIFRE KISMI
                  passwordhide(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: Colors.amber,
                        child: Text("Sign Up"),
                        onPressed: () {
                          String email = emailController.text;
                          String username = usernameController.text;
                          String password = passwordController.text;
                          int score = 0;
                          _insert(email, username, password, score);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _insert(
      String email, String username, String password, int score) async {
    Map<String?, dynamic> row = {
      DatabaseHelper.columnEmail: email,
      DatabaseHelper.columnUsername: username,
      DatabaseHelper.columnPassword: password,
      DatabaseHelper.comumnScore: score
    };

    Users user = Users.fromMap(row);
    final id = await dbHelper.insert(user);
    _showMessage('inserted row id: $id');
  }
}

class passwordhide extends StatefulWidget {
  const passwordhide({Key? key}) : super(key: key);

  @override
  State<passwordhide> createState() => _passwordhideState();
}

class _passwordhideState extends State<passwordhide> {
  bool _isObscure = true;
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      controller: passwordController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        labelText: "Password",
        labelStyle: TextStyle(
          color: Colors.purple,
        ),
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          color: Colors.amber,
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Sifrenizi girin";
        } else {
          return null;
        }
      },
    );
  }
}
