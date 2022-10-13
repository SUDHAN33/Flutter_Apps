

import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
 
   ReusableContainer({ required this.colour, required this.content});
  final Color colour;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: content,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        );
  }
}
