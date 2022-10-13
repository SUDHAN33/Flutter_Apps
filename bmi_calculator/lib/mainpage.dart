
import 'containericon.dart';
import 'reusablecontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constant.dart';
import 'result.dart';
import 'calculate.dart';

enum Gender {
  male,
  female,
}

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  Gender selected = Gender.male;
  int height = 170;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = Gender.male;
                        });
                      },
                      child: ReusableContainer(
                          colour: selected == Gender.male
                              ? activeColor
                              : inactiveColor,
                          content:
                              containericon(FontAwesomeIcons.mars, 'MALE'))),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = Gender.female;
                        });
                      },
                      child: ReusableContainer(
                          colour: selected == Gender.female
                              ? activeColor
                              : inactiveColor,
                          content:
                              containericon(FontAwesomeIcons.venus, 'FEMALE'))),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              colour: boxColor,
              content: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('HEIGHT', style: LabelStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: NumberStyle,
                      ),
                      const Text(
                        'cm',
                        style: LabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFFEB1555),
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          })),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: ReusableContainer(
                  colour: boxColor,
                  content: Column(
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: LabelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: NumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      // } ),
                    ],
                  ),
                )),
                Expanded(
                  child: ReusableContainer(
                    colour: boxColor,
                    content: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: LabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: NumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        // } ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Calculation calc = Calculation(height, weight);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Result(
                      calc.getBMI(),calc.getResult(),calc.getFeedback()
                    )));
              });
            },
            child: Container(
              child: Text(
                "CALCULATE",
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
