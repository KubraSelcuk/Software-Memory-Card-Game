import 'package:flutter/material.dart';
import 'package:software_memory_card_game/score_board.dart';
import 'cards.dart';
import 'dart:async';
import 'package:flip_card/flip_card.dart';

class FlipCardGane extends StatefulWidget {
  final Level _level;

  FlipCardGane(this._level);
  @override
  _FlipCardGaneState createState() => _FlipCardGaneState(_level);
}

class _FlipCardGaneState extends State<FlipCardGane> {
  _FlipCardGaneState(this._level);

  int _previousIndex = -1;
  bool _flip = false;
  bool _start = true;

  bool _wait = false;
  Level _level;
  late Timer _timer;
  int _time = 5;
  // ignore: unused_field
  var _left;
  late bool _isFinished;
  var _data;

  late List<bool> _cardFlips;
  late List<GlobalKey<FlipCardState>> _cardStateKeys;

  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              spreadRadius: 0.8,
              offset: Offset(2.0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.all(4.0),
      child: Image.asset(_data[index]),
    );
  }

  startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (mounted)
        setState(() {
          _time = _time - 1;
        });
    });
  }

  void restart() {
    startTimer();
    _data = getSourceArray(
      _level,
    );
    _cardFlips = getInitialItemState(_level);
    _cardStateKeys = getCardStateKeys(_level);
    _time = 10;
    _left = (_data.length ~/ 3);

    _isFinished = false;
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted)
        setState(() {
          _start = true;
          _timer.cancel();
        });
    });
  }

  @override
  void initState() {
    super.initState();

    restart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int deneme = 0;
  int puan = 0;
  @override
  Widget build(BuildContext context) {
    return _isFinished
        ? Scaffold(
            backgroundColor: Colors.redAccent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/cards/win.png'),
                      width: 200,
                      height: 200,
                    )
                  ],
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (mounted)
                        setState(() {
                          restart();
                          deneme = 0;
                          puan = 0;
                        });
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Text(
                        //replay buton bolumu
                        "Replay",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ))
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        scoreBoard("Try", "$deneme"),
                        scoreBoard("Score", "$puan"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _time > 0
                          ? Text(
                              '$_time',
                              style: Theme.of(context).textTheme.headline3,
                            )
                          : Text(
                              'Times up ¯\\_(ツ)_/¯',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                      //yonlendirme
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) => _start
                            ? FlipCard(
                                key: _cardStateKeys[index],
                                onFlip: () {
                                  if (!_flip) {
                                    _flip = true;
                                    _previousIndex = index;
                                    deneme++;
                                  } else {
                                    deneme++;
                                    _flip = false;
                                    if (_previousIndex != index) {
                                      if (_data[_previousIndex] !=
                                          _data[index]) {
                                        _wait = true;
                                        puan -= 2;
                                        Future.delayed(
                                            const Duration(milliseconds: 1500),
                                            () {
                                          _cardStateKeys[_previousIndex]
                                              .currentState
                                              ?.toggleCard();
                                          _previousIndex = index;
                                          _cardStateKeys[_previousIndex]
                                              .currentState
                                              ?.toggleCard();

                                          Future.delayed(
                                              const Duration(milliseconds: 160),
                                              () {
                                            if (mounted)
                                              setState(() {
                                                _wait = false;
                                              });
                                          });
                                        });
                                      } else {
                                        puan += 10;
                                        _cardFlips[_previousIndex] = false;
                                        _cardFlips[index] = false;

                                        print(_cardFlips);

                                        if (mounted)
                                          setState(() {
                                            _left -= 1;
                                          });
                                        if (_cardFlips
                                            .every((t) => t == false)) {
                                          print("Won");
                                          Future.delayed(
                                              const Duration(milliseconds: 160),
                                              () {
                                            if (mounted)
                                              setState(() {
                                                _isFinished = true;
                                                _start = false;
                                              });
                                          });
                                        }
                                      }
                                    }
                                  }
                                  if (mounted) setState(() {});
                                },
                                flipOnTouch: _wait ? false : _cardFlips[index],
                                direction: FlipDirection.HORIZONTAL,
                                front: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 168, 49, 49),
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 3,
                                          spreadRadius: 0.8,
                                          offset: Offset(2.0, 1),
                                        )
                                      ]),
                                  margin: const EdgeInsets.all(4.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/cards/soru.jpg",
                                    ),
                                  ),
                                ),
                                back: getItem(index))
                            : getItem(index),
                        itemCount: _data.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
