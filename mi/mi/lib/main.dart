import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
        backgroundColor: Colors.teal,
        body: SafeArea(

          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/images.jpg'),

              ),
              Text('Jackson',
                 style:  TextStyle(
                   fontSize: 40.0,
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontFamily: 'Pacifico',
                 ),
             ),
              Text('FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20.0,
                  color: Colors.tealAccent,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.tealAccent.shade400,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+91',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro',
                      color: Colors.teal[200],
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '@email.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro',
                      color: Colors.teal[200],
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}
// Row(
// children: <Widget>[
//
// Icon(
// Icons.email,
// color: Colors.teal,
// ),
// SizedBox(
// width: 10.0,
// ),
// Text(
// '@gmail.com',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontFamily: 'SourceSansPro',
// color: Colors.teal[200],
// fontSize: 20.0,
// ),
// ),
// ],
// ),