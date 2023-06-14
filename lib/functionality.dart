import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight,this.height});
  final weight;
  final height;
  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }else if(_bmi >= 18.5){
      return 'Normal';
    }else {
      return 'Underweight';
    }
}
  String getInterpretition(){
    if(_bmi >= 25){
      return 'You have a higher than a normal body weight. You have to do some exercises......';
    }else if(_bmi >= 18.5){
      return 'Good job ! You have a normal body weight';
    }else {
      return 'You have a lower than a normal body weight. You have to eat a little bit more.......';
    }
  }
}