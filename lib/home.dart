import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool player_o = true;

  bool isPlaying = false;

  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      isPlaying=controller.state==ConfettiControllerState.playing;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int score_o = 0, score_x = 0, count = 0;

  List<String> val = ['', '', '', '', '', '', '', '', ''];

  static var myFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3, fontSize: 15),
  );
  static var myWhiteFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15),
  );

  static var mySmallWhiteFont = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 10));

  void clear() {
    setState(() {
      for (int i = 0; i < 9; i++) val[i] = '';
    });
    count = 0;
  }

  void display_winner(String s) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hurray!!! WINNER IS: $s🥳🥳'),
            actions: [
              TextButton(
                onPressed: () {
                  controller.stop();
                  clear();
                  Navigator.of(context).pop();
                },
                child: Text("Play Again!"),
              )
            ],
          );
        });
    if (s == 'O') {
      score_o++;
    } else {
      score_x++;
    }
  }

  void display_draw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Oh! Damn It... It\'s a Draw🤦🏻‍♂️'),
            actions: [
              TextButton(
                onPressed: () {
                  clear();
                  Navigator.of(context).pop();
                },
                child: Text("Play Again!"),
              )
            ],
          );
        });
  }

  void check() {
    if (val[0] == val[1] && val[1] == val[2] && val[0] != '') {
      if(!isPlaying) {
        controller.play();
      }
      display_winner(val[0]);
    }
    if (val[3] == val[4] && val[4] == val[5] && val[3] != '') {
      if(!isPlaying) {
        controller.play();
      }
      display_winner(val[3]);
    }
    if (val[6] == val[7] && val[7] == val[8] && val[6] != '') {
      if(!isPlaying) {
        controller.play();
      }
      display_winner(val[6]);
    }
    if (val[0] == val[3] && val[3] == val[6] && val[0] != '') {
      if(!isPlaying) {
        controller.play();
      }
      display_winner(val[0]);
    }
    if (val[1] == val[4] && val[4] == val[7] && val[1] != '') {
      if(!isPlaying) {
        controller.play();
      }
      display_winner(val[1]);
    }
    if (val[2] == val[5] && val[5] == val[8] && val[2] != '') {
      if(!isPlaying) {
        controller.play();
      }
      display_winner(val[2]);
    }
    if (val[0] == val[4] && val[4] == val[8] && val[0] != '') {
      if(!isPlaying) {
        controller.play();
      }
      display_winner(val[0]);
    }
    if (val[2] == val[4] && val[4] == val[6] && val[2] != '') {
      if(!isPlaying) {
        controller.play();
      }
      display_winner(val[2]);
    } else if (count == 9) {
      display_draw();
    }
  }

  void _tapped(int index) {
    setState(() {
      if (player_o == true && val[index] == '') {
        val[index] = 'O';
        count++;
      } else if (player_o == false && val[index] == '') {
        val[index] = 'X';
        count++;
      }
      player_o = !player_o;
      check();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.topCenter,
        children: [
      Scaffold(
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, right: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Player O",
                            style: myWhiteFont,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            score_o.toString(),
                            style: myWhiteFont,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Player X",
                            style: myWhiteFont,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            score_x.toString(),
                            style: myWhiteFont,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(79, 79, 79, 1))),
                        child: Center(
                          child: Text(
                            val[index],
                            style: myWhiteFont,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: Container(
              child: Center(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(28.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 6,
                                blurRadius: 20,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: -6,
                                blurRadius: 20,
                              )
                            ]),
                        child: Text("TIC TAC TOE",
                            style: GoogleFonts.pressStart2p(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)))),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 35,
                        ),
                        Text(
                          "MADE WITH ",
                          style: mySmallWhiteFont,
                        ),
                        GlowIcon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 25,
                        ),
                        Text(
                          " @SRIKRISHNA",
                          style: mySmallWhiteFont,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      ConfettiWidget(
        confettiController: controller,
        shouldLoop: true,
        blastDirectionality: BlastDirectionality.explosive,
        numberOfParticles: 20,
        emissionFrequency: 0.02,
        gravity: 0.5,
      )
    ]);
  }
}
