import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ServicePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  late File _image;
  late List? _output;
  late String url;
  final imagepicker = ImagePicker();
  Calculation a = new Calculation();

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  detectimage(File image) async {
    List? prediction = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 10,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5,
        asynch: true);

    setState(() {
      _output = prediction;
      loading = false;
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickimage_camera() async {
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image);
  }

  pickimage_gallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 98, 3),
        title: Text(
          'FLORA AUXILIATOR',
        ),
      ),
      body: SingleChildScrollView(
      child: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/appbackground.jpg'),
        //     opacity: 0.7,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        height: h,
        width: w,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            // CircleAvatar(
            //   radius: 60,
            //   backgroundImage: AssetImage('assets/avatar.jpg'),
            // ),
            SizedBox(height: 10),
            Container(
                child: Text(' Upload The Picture ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 66, 98, 3),
                    ))),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                        color:Color.fromARGB(255, 66, 98, 3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Text('Capture',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              )),
                        ]),
                        onPressed: () {
                          pickimage_camera();
                        }),
                  ),
                  SizedBox(height: 20),
                   CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                        color:Color.fromARGB(255, 66, 98, 3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.photo_album,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Text('Gallery',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              )),
                        ]),
                        onPressed: () {
                          pickimage_gallery();
                        }),
                  ),
                ],
              ),
            ),
            loading != true
                ? Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 180,
                          padding: EdgeInsets.all(15),
                          child: Image.file(_image),
                        ),
                        _output != null
                            ? Text(a.Find(_output),
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ))
                            : Text(''),
                        _output != null
                            ? a.show(_output)?
                            Text(
                                "Botanical Name : " + a.BotanicalName(_output),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ))
                            : Text('')
                            : Text(''),
                            a.show(_output)?
                        Column(children: <Widget>[
                          Text(
                            "USES",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          _output != null
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    Text(
                                      '\u2022',
                                      style: TextStyle(
                                        fontSize: 18,
                                        height: 1.55,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          a.Uses1(_output),
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            height: 1.55,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Text(""),
                          _output != null
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    Text(
                                      '\u2022',
                                      style: TextStyle(
                                        fontSize: 18,
                                        height: 1.55,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          a.Uses2(_output),
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            height: 1.55,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Text(""),
                        ]):Text(""),
                        a.show(_output)?
                         GestureDetector(
                            child: Text("  Click here for more info",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Color.fromARGB(255, 66, 98, 3))),
                            onTap: () async {
                              url = a.Uses(_output);
                              if (await canLaunchUrl(Uri.parse(url))) {
                                launch(url);
                              }
                            },
                          ):Text(""),
                        a.show(_output)?
                        Column(
                          children: <Widget>[
                            Text(
                            "REMEDY",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                            _output != null
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    Text(
                                      '\u2022',
                                      style: TextStyle(
                                        fontSize: 18,
                                        height: 1.55,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          a.Remedy(_output),
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            height: 1.55,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Text(""),
                          ],
                        ):Text(""),
                        a.show(_output) ?
                         GestureDetector(
                            child: Text(" Click here for more info",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Color.fromARGB(255, 66, 98, 3))),
                            onTap: () async {
                              url = a.Remed(_output);
                              if (await canLaunchUrl(Uri.parse(url))) {
                                launch(url);
                              }
                            },
                          )
                          :Text(""),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    ));
  }
}
