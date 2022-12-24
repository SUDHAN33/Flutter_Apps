import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ServicePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late Animation<double> _angleAnimation;
  late Animation<double> _scaleAnimation;
  late AnimationController _controller;
  bool loading = true;
  bool _loadingInProgress = true;
  late File _image;
  late List? _output;
  late String url;
  final imagepicker = ImagePicker();
  Calculation a = new Calculation();

  @override
  void initState() {
    super.initState();
    _loadingInProgress = true;
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _angleAnimation = new Tween(begin: 0.0, end: 360.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    _scaleAnimation = new Tween(begin: 1.0, end: 6.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    _angleAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_loadingInProgress) {
          _controller.reverse();
        }
      } else if (status == AnimationStatus.dismissed) {
        if (_loadingInProgress) {
          _controller.forward();
        }
      }
    });

    _controller.forward();
    _loadData();
    loadmodel().then((value) {
      setState(() {});
    });

  }

  Future _loadData() async {
    await new Future.delayed(new Duration(seconds: 5));
    _dataLoaded();
  }

  void _dataLoaded() {
    setState(() {
      _loadingInProgress = false;
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
    _controller.dispose();
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
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text(
            'MEDICINAL PLANT DETECTOR',
          ),
        ),
        body:
        _loadingInProgress ?
        Center(
          child: _buildAnimation(),
        ) :
        SingleChildScrollView(
          child: Card(
             child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/appbackground.jpg'),
                opacity: 0.7,
                fit: BoxFit.cover,
              ),
            ),
            height: 1000,
            width: w,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                ),
                SizedBox(height: 10),
                Container(
                    child: Text(' Give The Image ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                            color: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.camera,
                                size: 40,
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text('CAPTURE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                  )),
                            ]),
                            onPressed: () {
                              pickimage_camera();
                            }),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        width: double.infinity,
                        child: RaisedButton(
                            color: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.image,
                                size: 40,//
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text('GALLERY',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(

                                    fontSize: 22,
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
                    ?
               Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 180,
                        padding: EdgeInsets.all(15),
                        child:
                        Image.file(_image),
                      ),
                      _output != null
                          ? Text(a.Find(_output),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ))
                          : Text(''),
                      _output != null
                          ? a.show(_output)?
                      Text(
                          "Botanical Name : " + a.BotanicalName(_output),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ))
                          : Text('')
                          : Text(''),
                      a.show(_output) ?
                      Column(children: <Widget>[
                        Text(
                          "USES",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        _output != null
                            ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(6),
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
                                    fontSize: 16,
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
                              margin: EdgeInsets.all(6),
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
                                    fontSize: 16,
                                    color: Colors.black,
                                    height: 1.55,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                            : Text(""),
                        GestureDetector(
                          child: Text(" For more information click here",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  color: Colors.green.shade900)),
                          onTap: () async {
                            url = a.Link(_output);
                            if (await canLaunchUrl(Uri.parse(url))) {
                              launch(url);
                            }
                          },
                        )
                      ]) : Text(''),
                    ],
                  ),
                )
                    : Container()
              ],
            ),
          ),
          ),
        ));
  }

  Widget _buildAnimation() {
    double circleWidth = 10.0 * _scaleAnimation.value;
    Widget circles = new Container(
    width: circleWidth * 2.0,
    height: circleWidth * 2.0,
    child: new Column(
    children: <Widget>[
    new Row (
    children: <Widget>[
    _buildCircle(circleWidth,Colors.blue),
    _buildCircle(circleWidth,Colors.red),
    ],
    ),
    new Row (
    children: <Widget>[
    _buildCircle(circleWidth,Colors.yellow),
    _buildCircle(circleWidth,Colors.green),
    ],
    ),
    ],
    ),
    );
    //_loadingInProgress = true;
    double angleInDegrees = _angleAnimation.value;
    return new Transform.rotate(
    angle: angleInDegrees / 360 * 2 * 3.14,
    child: new Container(
    child: circles,
    )
    ,
    );
  }

  Widget _buildCircle(double circleWidth, Color color) {
    return new Container(
      width: circleWidth,
      height: circleWidth,
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
