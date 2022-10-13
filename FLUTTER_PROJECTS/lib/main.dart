import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//return MaterialApp(
//   home : Scaffold(
//     backgroundColor: Colors.blueGrey,
//     appBar: AppBar(
//       centerTitle: true,
//       title: Text('I AM RICH'),
//       backgroundColor: Colors.blueGrey[900]
//     ),
//     body: const Center(
//       child: Image(
//         image: AssetImage('image/diamond.png'),
//       ),
//     ),
//   ),
// );
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
return MaterialApp(
  home : Scaffold(
    backgroundColor: Colors.blueGrey,
    appBar: AppBar(
      centerTitle: true,
      title: Text('I AM RICH'),
      backgroundColor: Colors.blueGrey[900]
    ),
    body: const Center(
      child: Image(
        image: AssetImage('image/diamond.png'),
      ),
    ),
  ),
);
  }
}


