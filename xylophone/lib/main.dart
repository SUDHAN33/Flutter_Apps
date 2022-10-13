import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audio_cache.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            // margin: new EdgeInsets.fromLTRB(0, 55, 0, 0),

            child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: FlatButton(
                          color: Colors.orange,
                          onPressed: () {
                            final player = AudioCache();
                            player.play('note1.wav');
                          },
                          child: (Text(''))),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: FlatButton(
                          color: Colors.deepPurple,
                          onPressed: () {
                            final player = AudioCache();
                            player.play('note2.wav');
                          },
                          child: (Text(''))),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: FlatButton(
                          color: Colors.blue,
                          onPressed: () {
                            final player = AudioCache();
                            player.play('note3.wav');
                          },
                          child: (Text(''))),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: FlatButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            final player = AudioCache();
                            player.play('note4.wav');
                          },
                          child: (Text(''))),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: FlatButton(
                          color: Colors.pink[300],
                          onPressed: () {
                            final player = AudioCache();
                            player.play('note5.wav');
                          },
                          child: (Text(''))),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: FlatButton(
                          color: Colors.yellow,
                          onPressed: () {
                            final player = AudioCache();
                            player.play('note6.wav');
                          },
                          child: (Text(''))),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: FlatButton(
                          color: Colors.red,
                          onPressed: () {
                            final player = AudioCache();
                            player.play('note7.wav');
                          },
                          child: (Text(''))),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

