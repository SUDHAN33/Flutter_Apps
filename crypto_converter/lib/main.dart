import 'package:flutter/material.dart';
import 'rate.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.blueAccent),
      home: PriceScreen(),
    );
  }
}
