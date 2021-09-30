// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff090c22)),
        scaffoldBackgroundColor: const Color(0xff090c22),
        colorScheme: const ColorScheme.dark().copyWith(secondary: Colors.purple),
        
        ), 
      home: InputPage(),
    );
  }
}

