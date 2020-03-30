import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'gender_detail.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';
enum Gender{
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {

Gender selectedGender;
int height=183;
int weight=74;
int age=19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender=Gender.male;
                        });
                      },
                      colour: selectedGender== Gender.male?kActiveCardColor:kInactiveCardColor,
                      cardChild: GenderDetail(icon: FontAwesomeIcons.mars,label: 'MALE',),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    colour: selectedGender==Gender.female?kActiveCardColor:kInactiveCardColor,
                    cardChild: GenderDetail(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child:ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                       Text(
                         height.toString(),
                         style: kNumberTextStyle,
                       ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),

                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x34EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 23.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                colour: kActiveCardColor,
              ),
          ),
          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',style: kLabelTextStyle,),
                      Text(weight.toString(),style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                  colour: kActiveCardColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: kLabelTextStyle,),
                      Text(age.toString(),style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: kActiveCardColor,
                ),
              ),
            ],
          ),),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);


              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
                 ),
                ),
              );
            },
          ),
        ],
      ),

    );
  }
}






