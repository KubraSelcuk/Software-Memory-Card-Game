import 'package:flutter/material.dart';
import 'package:software_memory_card_game/score_table.dart';
import 'package:software_memory_card_game/software_memory_card.dart';
import 'cards.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// ignore: must_be_immutable
class Details {
  String name;
  Color primarycolor;
  Color secomdarycolor;
  Widget goto;

  Details(
      {required this.name,
      required this.primarycolor,
      required this.secomdarycolor,
      required this.goto});
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Software Memory Card Game',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => _list[index].goto,
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: _list[index].secomdarycolor,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black45,
                              spreadRadius: 0.5,
                              //offset: Offset(3, 4)
                            )
                          ]),
                    ),
                    Container(
                      height: 90,
                      width: double.infinity,
                      decoration:
                          BoxDecoration(color: _list[index].primarycolor,
                              // borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12,
                              spreadRadius: 0.3,
                              //offset: Offset(
                              // 5,3,)
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            _list[index].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black26,
                                    blurRadius: 2,
                                    //offset: Offset(1, 2),
                                  ),
                                  //Shadow(
                                  // color: Colors.black,
                                  //blurRadius: 2,
                                  //offset: Offset(0.5, 2)
                                ]),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Details> _list = [
    Details(
        name: "EASY",
        primarycolor: Colors.green,
        secomdarycolor: Color.fromARGB(255, 197, 189, 189),
        goto: FlipCardGane(Level.Easy)),
    Details(
        name: "HARD",
        primarycolor: Colors.orange,
        secomdarycolor: Color.fromARGB(255, 197, 189, 189),
        goto: FlipCardGane(Level.Hard)),
    Details(
        name: "SCORE TABLE",
        primarycolor: Colors.purple,
        secomdarycolor: Color.fromARGB(255, 197, 189, 189),
        goto: ScoreTable()),
  ];
}
