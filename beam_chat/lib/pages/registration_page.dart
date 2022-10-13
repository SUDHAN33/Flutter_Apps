import 'package:flutter/material.dart';
import 'package:beam_chat/components.dart';
import 'package:beam_chat/constant.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = "registration_page";
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo', 
              child:  Container(
              height: 200.0,
              child: Image.asset('images/logo.png'),
            ),
        ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration:kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
           RoundedButton('Register', Colors.blueAccent,((){}),),
          ],
        ),
      ),
    );
  }
}