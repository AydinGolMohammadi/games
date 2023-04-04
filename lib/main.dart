import 'package:flutter/material.dart';
import 'package:games/games/Puzzle/puzzle.dart';

import 'games/2048/main.dart';
import 'games/TicTacToe/tic_tac_toe.dart';
import 'games/rockPaperScisser/rock_paper_scisser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TicTacToe()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade700,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                height: 50,
                width: 200,
                child: const Center(
                  child: Text(
                    'TicTacToe Game',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PuzzleGame()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red.shade700,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 50,
                width: 200,
                child: const Center(
                  child: Text(
                    'Puzzle Game',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RockPaperScisser(),
                  ),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 50,
                width: 200,
                child: const Center(
                  child: Text(
                    'RockPaperScisser Game',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Game2048(),
                  ),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 50,
                width: 200,
                child: const Center(
                  child: Text(
                    '2048 Game',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
