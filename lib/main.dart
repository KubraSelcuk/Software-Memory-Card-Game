import 'package:flutter/material.dart';
import 'package:software_memory_card_game/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Software Memory Card Game',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          // scaffoldBackgroundColor: Color.fromARGB(255, 14, 255, 243),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Login(),
    );
  }
}
