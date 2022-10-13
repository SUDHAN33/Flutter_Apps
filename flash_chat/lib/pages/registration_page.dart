import 'package:flutter/material.dart';
import 'package:flash_chat/components.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = "registration_page";
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _auth = FirebaseAuth.instance;
  String email ="";
  String password = "";
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child:  Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),

            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration:kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton('Register', Colors.blueAccent,(()async{
              setState(() {
                spinner =true;
              });
              try{
                final user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                if(user != null){
                  Navigator.pushNamed(context, ChatPage.id);
                }
                setState(() {
                  spinner =false;
                });
              }
              catch(e){
                print(e);
              }
            }),
            ),
          ],
        ),
      ),
      ),
    );
  }
}