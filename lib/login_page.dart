import 'package:flutter/material.dart';
import 'package:software_memory_card_game/home.dart';
import 'package:software_memory_card_game/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //1

  //sifre gizleme
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String username;
    // ignore: unused_local_variable
    String password;
    return Scaffold(
      backgroundColor: Colors.redAccent,
      resizeToAvoidBottomInset: false,
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              "Software",
              style: TextStyle(
                  color: Colors.amber,
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Memory",
              style: TextStyle(
                  color: Colors.amber,
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Card",
              style: TextStyle(
                  color: Colors.amber,
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Game",
                  style: TextStyle(
                      color: Colors.amber,
                      height: 1.5,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              cursorColor: Colors.white,
              controller: usernameController,
              decoration: InputDecoration(
                  fillColor: Colors.amber,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: "Username",
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                username = value!;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: _isObscure,
              controller: passwordController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
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
              onSaved: (value) {
                username = value!;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  child: Text("Sign up"),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  ),
                ),
                MaterialButton(
                  child: Text("I forgot my password"),
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.amber,
                  child: Text("Login"),
                  onPressed: () {
                    // ignore: unused_local_variable
                    String username = usernameController.text;
                    // ignore: unused_local_variable
                    String password = passwordController.text;
                    /*Future<int> addUsers() async {
                      User firstUser = User(name: "peter", score: 24,);
                      User secondUser = User(name: "john", score: 31);
                      List<User> listOfUsers = [firstUser, secondUser];
                      return await this.handler.insertUser(listOfUsers);
                    }*/
                    //_getLogin(username, password);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/cards/brainjpg.png'),
                  width: 300,
                  height: 200,
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
