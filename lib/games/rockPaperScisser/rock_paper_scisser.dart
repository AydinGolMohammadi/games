import 'dart:math';
import 'package:flutter/material.dart';

class RockPaperScisser extends StatefulWidget {
  const RockPaperScisser({Key? key}) : super(key: key);

  @override
  _RockPaperScisserState createState() => _RockPaperScisserState();
}

class _RockPaperScisserState extends State<RockPaperScisser> {
  int top = 2;
  int bottom = 2;

  @override
  Widget build(BuildContext context) {
    print('log');
    return Scaffold(
        appBar: AppBar(
          title: Text('RockPaperScisser'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/$top.png'),
                  height: 100.0,
                ),
                Container(
                  height: 60,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      setState(() {
                        top = Random().nextInt(3) + 1; //0-2-> 1 3
                        bottom = Random().nextInt(3) + 1;
                      });
                    },
                    child: const Text(
                      'Play',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Image(
                  image: AssetImage('assets/images/$bottom.png'),
                  height: 100.0,
                ),
              ],
            ),
          ),
        ),
    );
  }
}
