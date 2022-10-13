import 'package:flutter/material.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

int score = 1;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: const Text('Dicee'),
            backgroundColor: Colors.red,
          ),
          body: DicePage()),
    );
  }
}

//  Expanded(
//                 child: Text(ans.bingo()),
//               ),
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int l = 1;
  int r = 6;
  void pressed() {
    setState(() {
      l = Random().nextInt(6) + 1;
      r = Random().nextInt(6) + 1;
      if (l == r) {
        Alert(
          context: context,
          title: 'Bingo!',
          desc: 'You got same number on both die. Your score is $score',
        ).show();
        score++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                pressed();
              },
              child: Image.asset('images/dice$l.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                pressed();
              },
              child: Image.asset('images/dice$r.png'),
            ),
          ),
        ],
      ),
    );
  }
}
