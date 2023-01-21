import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constatnts.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int age = 0;
  int weight = 0;
  int hight = 150;
  GenderType? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    cardChild: IconContent(
                      gender: "male",
                      genderSign: FontAwesomeIcons.mars,
                      iconColor: Colors.blue,
                    ),
                    colour: selectedGender == GenderType.male
                        ? kActiveCardColour
                        : kInactiveCsrdColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    cardChild: IconContent(
                      gender: "FEMALE",
                      genderSign: FontAwesomeIcons.venus,
                      iconColor: kBottomContainerColor,
                    ),
                    colour: selectedGender == GenderType.female
                        ? kActiveCardColour
                        : kInactiveCsrdColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HIGHT',
                    style: TextStyle(
                      fontSize: 18,
                      color: kContainerLableColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        hight.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text('cm', style: kLableTextStyle),
                    ],
                  ),
                  Slider(
                    value: hight.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        hight = newValue.round();
                      });
                    },
                  )
                ],
              ),
              colour: kActiveCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18,
                            color: kContainerLableColor,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                              backgroundColor: Color(0xFF8D8E98),
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Color(0xFF8D8E98),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18,
                            color: kContainerLableColor,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                              backgroundColor: Color(0xFF8D8E98),
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Color(0xFF8D8E98),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(fontSize: 30),
              ),
            ),
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHight,
          ),
        ],
      ),
    );
  }

  Column ageWeightCardes(String cardName, int variableName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cardName,
          style: TextStyle(fontSize: 18, color: kContainerLableColor),
        ),
        SizedBox(height: 5),
        Text(
          variableName.toString(),
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (variableName > 0) {
                    variableName--;
                  }
                });
              },
              backgroundColor: kContainerLableColor,
              child: Icon(Icons.remove),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  variableName++;
                });
              },
              backgroundColor: kContainerLableColor,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
