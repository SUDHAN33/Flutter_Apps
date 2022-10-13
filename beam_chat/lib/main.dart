import 'package:flutter/material.dart';
import 'package:beam_chat/pages/welcome_page.dart';
import 'package:beam_chat/pages/login_page.dart';
import 'package:beam_chat/pages/registration_page.dart';
import 'package:beam_chat/pages/chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomePage.id,
      routes: {
             WelcomePage.id : (context) => WelcomePage(),
             LoginPage.id : (context) => LoginPage(),
             RegistrationPage.id : (context) => RegistrationPage(),
             ChatPage.id : (context) => ChatPage(),
      },
    );
  }
}
