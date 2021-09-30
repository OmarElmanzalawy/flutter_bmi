// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_widgets.dart';
import 'constants.dart';
import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderCard? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = GenderCard.male;
                  });
                },
                child: CustomCard(
                  color: selectedGender == GenderCard.male
                      ? kActiveBackgroundCard
                      : kIdleBackgroundCard,
                  cardChild: IconCard(
                    icon: Icon(
                      FontAwesomeIcons.mars,
                      color: selectedGender == GenderCard.male ? kWhite : kGrey,
                      size: 80,
                    ),
                    title: 'Male',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = GenderCard.female;
                  });
                },
                child: CustomCard(
                  color: selectedGender == GenderCard.female
                      ? kActiveBackgroundCard
                      : kIdleBackgroundCard,
                  cardChild: IconCard(
                    icon: Icon(
                      FontAwesomeIcons.venus,
                      color:
                          selectedGender == GenderCard.female ? kWhite : kGrey,
                      size: 80,
                    ),
                    title: 'Female',
                  ),
                ),
              ),
            ],
          ),
          CustomCard(
            width: MediaQuery.of(context).size.width,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kTitleStyle,
                ),
                RichText(
                  text: TextSpan(
                    text: '$height',
                    style: kBoldStyle,
                    children: const [
                      TextSpan(
                          text: 'cm',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: kGrey,
                              fontSize: 30))
                    ],
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xff888993),
                      activeTrackColor: Color(0xffffffff),
                      thumbColor: Color(0xffeb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayColor: Color(0xff5d1437),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 27)),
                  child: Slider(
                    value: height.toDouble(),
                    max: 220,
                    min: 100,
                    //activeColor: Color(0xffeb1555),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCard(
                height: MediaQuery.of(context).size.height * 0.20,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kTitleStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kBoldStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icn: Icons.add,
                          backgroundColor: Colors.blueGrey.shade800,
                          onpressed: () {
                            setState(() {
                              weight += 1;
                            });
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        RoundIconButton(
                          icn: Icons.remove,
                          backgroundColor: Colors.blueGrey.shade800,
                          onpressed: () {
                            setState(() {
                              weight -= 1;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              CustomCard(
                height: MediaQuery.of(context).size.height * 0.20,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kTitleStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kBoldStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icn: Icons.add,
                          backgroundColor: Colors.blueGrey.shade800,
                          onpressed: () {
                            setState(() {
                              age += 1;
                            });
                          },
                        ),
                        RoundIconButton(
                          icn: Icons.remove,
                          backgroundColor: Colors.blueGrey.shade800,
                          onpressed: () {
                            setState(() {
                              age -= 1;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    
                  });
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsScreen()));
                  CalculatorBrain brain = CalculatorBrain(height,weight);
                  bmi = brain.calculateBMI().toDouble();
                  bmiType = brain.getResult();
                  bmiDescription = brain.description[bmiType]!;
                },
                child: Container(
                  child: Center(child: Text('CALCULATE',style: kSmallBoldStyle,)),
                  width: MediaQuery.of(context).size.width,
                  color: kBottomContainerColor,
                  margin: EdgeInsets.only(top: 5),
                ),
                ),
          ),
        ],
      ),
    );
  }
}
