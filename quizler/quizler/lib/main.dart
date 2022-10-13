import 'package:flutter/material.dart';
import 'quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

QuizBrain q =  QuizBrain();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quizzler(),
          ),
        ),
      ),
    );
  }
}

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> score = [];
  void checkAnswer(bool ans) {
    bool qans = q.getCorrectAnswer();
    setState(() {
      if (q.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You have reached the end of the quiz',
        ).show();
        q.reset();
        score = [];
      } else {
        if (ans == qans) {
          score.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          score.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        q.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                q.getQuestionText(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: score,
        ),
      ],
    );
  }
}
