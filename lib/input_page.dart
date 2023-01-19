import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColour = Color(0xFF1D1E33);
const inactiveCsrdColour = Color(0xFF111328);
const containerLableColor = Color(0xFF8D8E98);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int age = 0;
  int weight = 0;
  Color maleCardColour = inactiveCsrdColour;
  Color femaleCardColour = inactiveCsrdColour;

  // 1 == male, 2 == female
  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCsrdColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCsrdColour;
      } else {
        maleCardColour = inactiveCsrdColour;
      }
    } else {
      if (femaleCardColour == inactiveCsrdColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCsrdColour;
      } else {
        femaleCardColour = inactiveCsrdColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(1);
                      });
                    },
                    child: ReusableCard(
                      cardChild: IconContent(
                          gender: "male", genderSign: FontAwesomeIcons.mars),
                      colour: maleCardColour,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: ReusableCard(
                      cardChild: IconContent(
                        gender: "FEMALE",
                        genderSign: FontAwesomeIcons.venus,
                      ),
                      colour: femaleCardColour,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.mars,
                    size: 80.0,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "MALE",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                ],
              ),
              colour: activeCardColour,
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
                            color: containerLableColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          weight.toString(),
                          style: TextStyle(fontSize: 40),
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
                    colour: activeCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18,
                            color: containerLableColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          age.toString(),
                          style: TextStyle(fontSize: 40),
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
                    colour: activeCardColour,
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
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHight,
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
          style: TextStyle(fontSize: 18, color: containerLableColor),
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
              backgroundColor: containerLableColor,
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
              backgroundColor: containerLableColor,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
