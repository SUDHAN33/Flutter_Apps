import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[500],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text(
            'Ask Me Anything',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
        body: SafeArea(
          child: BallChange(),
        ),
      ),
    );
  }
}

class BallChange extends StatefulWidget {
  const BallChange({Key? key}) : super(key: key);

  @override
  _BallChangeState createState() => _BallChangeState();
}

class _BallChangeState extends State<BallChange> {
  int change = 1;
  void changeBall() {
    setState(() {
      change = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      
        children: <Widget>[
          
          Container(
            color: Colors.blue[500],
              child:TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey,
                  icon: Icon(
                    Icons.question_answer_sharp,
                    color: Colors.blueGrey,
                  ),
                  hintText: 'Ask me any yes or no question in your heart',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
                
              ),
          ),
              Expanded(
               child :FloatingActionButton(
                  onPressed: () {
                     changeBall();

                  },
                  child: Text('Ask',
                  style: TextStyle(
                    color:Colors.white,
                  ),),
                ),
               
              ),
          Expanded(
            child:
               Image.asset('images/ball$change.png'),
            ),
          
        ],
      ),
    );
  }
}
