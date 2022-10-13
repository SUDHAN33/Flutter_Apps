import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/reusablecontainer.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(this.BMI,this.condition,this.Feedback);
  final String BMI;
  final String condition;
  final String Feedback;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              colour: activeColor,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    condition,
                    style: ResultTextStyle,
                  ),
                  Text(
                    BMI,
                    style: BMITextStyle,
                  ),
                  Text(
                    Feedback,
                    textAlign: TextAlign.center,
                    style: BodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Text(
                "RE-CALCULATE",
                textAlign: TextAlign.center,
                style: LargeButtonTextStyle,
              ),
              color: BottomContainerColour,
              height: bottomContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(25.0),
            ),
          ),
        ],
      ),
    );
  }
}
