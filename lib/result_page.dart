import 'package:bmicalculator/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'constants.dart';

class Result extends StatelessWidget {
  Result({required this.bmiResult, required this.interpretition, required this.resultText});
  String bmiResult;
  String interpretition;
  String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title : Text('BMI Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                // margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(15),
                  alignment: Alignment.bottomLeft,
                  child: Text('Your Result',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),))),
          Expanded(
            flex: 5,
              child: ResuableCard(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                    style: kBMItextStyle,),
                    Text(interpretition,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,),
                  ],
                ),
              )
          ),
          BottomButton(
              onTap: (){
                Navigator.pop(context);
              },
              bottomText: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
