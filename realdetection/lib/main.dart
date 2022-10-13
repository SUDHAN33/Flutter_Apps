import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Myapp(),
    );
  }
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => new _MyappState();
}

class _MyappState extends State<Myapp> {
  late File _image;
  late List _results;
  final imagepicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image classification'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickAnImage,
        tooltip: 'Select Image',
        child: Icon(Icons.image),
      ),
      body: Column(
        children: <Widget>[
          if (_image != null)
            Container(margin: EdgeInsets.all(10), child: Image.file(_image))
          else
            Container(
              margin: EdgeInsets.all(40),
              child: Opacity(
                opacity: 0.6,
                child: Center(
                  child: Text('No Image Selected!'),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: _results != null
                  ? _results.map((result) {
                      return Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "${result["label"]} -  ${result["confidence"].toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }).toList()
                  : [],
            ),
          ),
        ],
      ),
    );
  }

  Future loadModel() async {
    Tflite.close();
    var res;
    res = await Tflite.loadModel(
      model: "assets/tflite_model.tflite",
      labels: "assets/labels.txt",
    );
    print(res);
  }

  pickAnImage() async {
    // pick image and...
    var image = await imagepicker.pickImage(source: ImageSource.gallery);
     if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    imageClassification(_image);
  }

  Future imageClassification(File image) async {
    // Run tensorflowlite image classification model on the image
     List? results = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 10,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = results!;
      _image = image;
    });
  }
}
