import 'dart:math';
import 'constants.dart';
class CalculatorBrain{

CalculatorBrain(this.height,this.weight);

final int weight;
final int height;

 
num _bmi =bmi ?? 0;

num calculateBMI(){
  num mHeight = height / 100;
  num _bmi = weight/(pow(mHeight, 2));
  return _bmi;
}

String getResult(){
  print(_bmi);
  if(_bmi >= 25){
    return 'Overweight';
  }
  else if(_bmi > 18.5){
    return 'healthy';
  }
  else {return 'Underweight';}
}

Map<String,String> description = {
  'Overweight':'You have a higher normal body weight. You should exercise more.',
  'Underweight':'You have lower body weight than normal. You should eat more.',
  'healthy':'You have a good body weight. Great job!'
  };

}