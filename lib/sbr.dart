import 'dart:math';
import 'package:flutter/material.dart';

class SPR extends StatefulWidget {
  const SPR({super.key});

  @override
  State<SPR> createState() => _SPRState();
}

class _SPRState extends State<SPR> {
  int comp = 1;
  int user = 1;
  int round = 0;
  int compScore = 0;
  int userScore = 0;

  void randMe() {
    setState(() {
      comp = Random().nextInt(2) + 1;
      user = Random().nextInt(2) + 1;
      if (comp != user) {
        if ((comp == 2 && user == 3) ||
            (comp == 3 && user == 1) ||
            (comp == 1 && user == 2)) {
          userScore++;
          round++;
        } else {
          compScore++;
          round++;
        }
      }

      if (compScore == 5 || userScore == 5) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Game Over'),
              content: Text(userScore == 5 ? 'You won!' : 'Computer won!'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    resetGame();
                    Navigator.of(context).pop();
                  },
                  child: Text('Play Again'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void resetGame() {
    setState(() {
      compScore = 0;
      userScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: randMe,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("S P R")),
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 80.0),
                child: Column(
                  children: [
                    Text(
                      "Round #$round",
                      style: TextStyle(
                          color: Colors.yellowAccent.shade100,
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 5,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.yellow.shade100),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 50, end: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Computer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "You",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset("assets/images/image$comp.png"),
                    ),
                  ),
                  Text(
                    "Vs",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset("assets/images/image$user.png"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 80.0),
                child: Text(
                  "Computer Score: $compScore",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 15.0),
                child: Text(
                  "User Score: $userScore",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
