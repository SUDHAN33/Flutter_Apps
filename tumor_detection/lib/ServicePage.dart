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
    if (int.parse((name![0]['label']).toString().substring(0, 2)) == 11) {
      return false;
    } else {
      return true;
    }
  }

  String Result(List? name) {
    pos = int.parse((name![0]['label']).toString().substring(0, 1));
    return ResultName[pos];
  }
}

