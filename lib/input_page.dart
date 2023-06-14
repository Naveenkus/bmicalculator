import 'package:bmicalculator/result_page.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/icon_content.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/round_icon_button.dart';
import 'package:bmicalculator/bottom_button.dart';
import 'package:bmicalculator/functionality.dart';


class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender{ male, female}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 150;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "BMI Calculator"
        ),
      ),
      backgroundColor: Color(0xFF0d0c22),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ResuableCard(
                        onPress :(){
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                          colour: selectedGender == Gender.male ? kactiveCardColor : kinactiveCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                        label: 'MALE',)
                  ),),
                  Expanded(
                      child: ResuableCard(
                        onPress : (){
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female ? kactiveCardColor : kinactiveCardColor,
                        cardChild: IconContent(
                            icon: FontAwesomeIcons.venus, label:'FEMALE'
                        ),)
                  ),
                ],
              ),
            ),
            Expanded(
                child: ResuableCard(
                  colour: kactiveCardColor,
                  cardChild:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('HEIGHT',
                      textAlign: TextAlign.center,
                      style: klabelTextStyle ,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(),
                          style: knumberTextStyle,),
                          Text('cm',
                          style: klabelTextStyle,)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Colors.blue.shade400,
                          overlayColor: Color(0x2942A5F5),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                        ),
                        child: Slider(value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,

                            onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                            }),
                      )
                    ],
                  ),)
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ResuableCard(
                        colour: kactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT',
                            style: klabelTextStyle,),
                            Text(weight.toString(),
                            style: knumberTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(width: 12.0,),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.add,
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                  Expanded(
                      child: ResuableCard(
                        colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',
                            style: klabelTextStyle,),
                          Text(age.toString(),
                            style: knumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 12.0,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.add,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),)
                  ),
                ],
              ),
            ),
            BottomButton(onTap:  (){
              CalculatorBrain calc = CalculatorBrain(weight: weight , height: height);
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Result(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretition: calc.getInterpretition(),)),);
              },) ;},
              bottomText: 'CALCULATE',)
          ],
        ),
      ),
    );
  }
}






