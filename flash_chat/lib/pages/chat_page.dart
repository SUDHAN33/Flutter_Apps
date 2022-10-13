
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'welcome_page.dart';

final store = FirebaseFirestore.instance;
User? login = FirebaseAuth.instance.currentUser;

class ChatPage extends StatefulWidget {
  static const String id = "chat_page";
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messageController = TextEditingController();
  final auth = FirebaseAuth.instance;
  late  String messages;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser()async{
    try{
      final user = await auth.currentUser;
      if(user != null){
           login = user;
      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        messages = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      messageController.clear();
                      store.collection('messages').add({
                        'message' : messages,
                        'user' : login?.email,
                      }
                      );
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: store.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Center(
            child : CircularProgressIndicator(),
          );
        }
        final snap= snapshot.data!.docs.reversed;
        List<MessageWidget> messageWidgets = [];
        for(var info in snap){
          final text = info.get('message');
          final user = info.get('user');
          final currentUser = login?.email;
          final messageWidget = MessageWidget(text, user, currentUser == user);
          messageWidgets.add(messageWidget);
        };
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class MessageWidget extends StatelessWidget {
  MessageWidget(this.text,this.user,this.who);
  final String text;
  final String user;
  final bool who;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: who ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              user,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 12.0,
              ),
            ),
            Material(
              elevation: 5.0,
              borderRadius:  who ?  BorderRadius.only(topLeft: Radius.circular(20.0),bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0))
              : BorderRadius.only(topRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
              color: who? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Text(
                text ,
                style: TextStyle(
                  color: who?  Colors.blueGrey.shade900 : Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
    ),
          ],
        ),
      );
  }
}

