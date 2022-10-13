
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           home: MyPage(),
          );
        }


}
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {

   File imageFile = File("");
  ImagePicker picker = ImagePicker();

  _getFromGallery() async {
    XFile? pickedFile = await picker.pickImage(
      source:ImageSource.gallery,
       //maxWidth:
      //maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      //maxWidth: 1800,
      //maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
        body: Container(
            child: imageFile == null
                 ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.greenAccent,
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Text("PICK FROM GALLERY"),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  RaisedButton(
                    color: Colors.lightGreenAccent,
                    onPressed: () {
                      _getFromCamera();
                    },
                    child: Text("PICK FROM CAMERA"),
                  )
                ],
              ),
            ): Container(
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
            )));
  }

  /// Get from gallery

}
