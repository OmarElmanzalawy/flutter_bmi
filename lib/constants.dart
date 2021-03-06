import 'package:flutter/material.dart';

const TextStyle kTitleStyle = TextStyle(fontSize: 25,color: kGrey);
const TextStyle kBoldStyle = TextStyle(fontSize: 50,fontWeight: FontWeight.w900);
const TextStyle kSmallBoldStyle = TextStyle(fontSize: 30,fontWeight: FontWeight.w900);
const TextStyle kGreenSmallHeader = TextStyle(color: kGreen,fontWeight: FontWeight.bold,fontSize: 20);
const Color kGrey = Color(0xff8d8e98);
const int kIconSize = 80;
const Color kWhite = Color(0xffffffff);
const Color kActiveBackgroundCard = Color(0xff1d1f33);
const Color kIdleBackgroundCard = Color(0xff111328);
const Color kMaleCardColor = kIdleBackgroundCard;
const Color kFemaleCardColor = kIdleBackgroundCard;
const Color kBottomContainerColor = Color(0xffeb1555);
const Color kGreen = Color(0xff54af7c);
String bmiType='';
String bmiDescription='none';
int weight =50;
int age = 18;
int height = 180;
double? bmi;