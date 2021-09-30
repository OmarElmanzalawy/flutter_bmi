import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'calculator_brain.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Your Results',style: kBoldStyle
              ),
            ),
            ),
          Expanded(
            flex: 8,
            child: CustomCard(
              color: kActiveBackgroundCard,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(16),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(70.0),
                    child: Text(bmiType.toUpperCase(),
                    style: kGreenSmallHeader 
                    ),
                  ),
                  Text(bmi!.toStringAsPrecision(3),style: kBoldStyle.copyWith(fontSize: 80)),
                  SizedBox(height: MediaQuery.of(context).size.height*0.14,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,left: 8,right: 8),
                    child: Text(bmiDescription,style: kTitleStyle.copyWith(color: kWhite,fontSize: 20),),
                  ),
                ],
              )
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                    child: Center(child: Text('RETURN TO HOME',style: kSmallBoldStyle,)),
                    width: MediaQuery.of(context).size.width,
                    color: kBottomContainerColor,
                    margin: EdgeInsets.only(top: 5),
                  ),
            ),
          ),
        ],
      )
    );
  }
}