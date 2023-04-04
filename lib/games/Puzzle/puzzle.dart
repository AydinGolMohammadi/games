import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: PuzzleGame(),
    );
  }
}

class PuzzleGame extends StatefulWidget {
  @override
  _PuzzleGameState createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  late List<int> board;
  int size = 3;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    board = List.generate(size * size, (index) => index);
    shuffleBoard();
  }

  void shuffleBoard() {
    for (var i = board.length - 1; i > 0; i--) {
      var j = random.nextInt(i + 1);
      var temp = board[i];
      board[i] = board[j];
      board[j] = temp;
    }
  }

  void moveTile(int index) {
    if (index % size > 0 && board[index - 1] == size * size - 1) {
      setState(() {
        var temp = board[index - 1];
        board[index - 1] = board[index];
        board[index] = temp;
      });
    }
    if (index % size < size - 1 && board[index + 1] == size * size - 1) {
      setState(() {
        var temp = board[index + 1];
        board[index + 1] = board[index];
        board[index] = temp;
      });
    }
    if (index - size >= 0 && board[index - size] == size * size - 1) {
      setState(() {
        var temp = board[index - size];
        board[index - size] = board[index];
        board[index] = temp;
      });
    }
    if (index + size < size * size && board[index + size] == size * size - 1) {
      setState(() {
        var temp = board[index + size];
        board[index + size] = board[index];
        board[index] = temp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle Game'),
        backgroundColor: Colors.red.shade500,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 310,
              width: 310,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red.shade900,
                    width: 2,
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: size,
                    ),
                    itemCount: size * size,
                    itemBuilder: (BuildContext context, int index) {
                      if (board[index] == size * size - 1) {
                        return Container();
                      } else {
                        return GestureDetector(
                          onTap: () {
                            moveTile(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: Colors.red.shade700,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text('${board[index]}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  )),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
