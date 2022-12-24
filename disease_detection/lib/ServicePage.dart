import 'package:flutter/material.dart';
import 'Homepage.dart';

class Calculation {
  List? name;
  late int pos;
  List ResultName = [
    "Tumor",
    "Not Tumor",
  ];

  String Find(List? name) {
    try {
      return (name![0]['label']).toString().substring(2);
    } catch (e) {
      return "Retry";
    }
  }

  bool show(List? name) {
    if (int.parse((name![0]['label']).toString().substring(0, 2)) == 16) {
      return false;
    } else {
      return true;
    }
  }

  String Result(List? name) {
    List? a = name;
    if (Find(name) != "Retry" ||
        (a![0]['label']).toString().substring(3) != "Retake The Image") {
      pos = int.parse((name![0]['label']).toString().substring(0, 1));
      return ResultName[pos];
    } else {
      return "";
    }
  }

}