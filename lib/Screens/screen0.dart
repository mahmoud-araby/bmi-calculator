import 'package:bmi_calculator/component/Reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Functionality.dart';
import '../constants.dart';
import 'screen1.dart';

Functionality BMI = Functionality();

class screen_0 extends StatefulWidget {
  @override
  _screen_0State createState() => _screen_0State();
}

class _screen_0State extends State<screen_0> {
  Color MALE_COLOR = KDisActiveCard;
  Color FEMALE_COLOR = KDisActiveCard;

  Gender_Select(Gender gender) {
    setState(() {
      if (gender == Gender.Male) {
        BMI.gender = Gender.Male;
        MALE_COLOR = KActiveCard;
        FEMALE_COLOR = KDisActiveCard;
      } else if (gender == Gender.Female) {
        BMI.gender = Gender.Female;
        FEMALE_COLOR = KActiveCard;
        MALE_COLOR = KDisActiveCard;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Row(
            children: <Widget>[
              ReusbleCard(
                  text: 'MALE',
                  icon: FontAwesomeIcons.male,
                  color: MALE_COLOR,
                  action: () {
                    Gender_Select(Gender.Male);
                  }),
              ReusbleCard(
                  text: 'FEMALE',
                  icon: FontAwesomeIcons.female,
                  color: FEMALE_COLOR,
                  action: () {
                    Gender_Select(Gender.Female);
                  }),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: SliderCard(
            heading: 'Height',
            ON_SCREEN: BMI.height,
            Action: (newValue) {
              setState(() {
                BMI.height = newValue.toInt();
              });
            },
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PlusMinusCard(
                headingtext: 'Age',
                ONSCREEN: BMI.age,
                plusaction: () {
                  setState(() {
                    BMI.age++;
                  });
                },
                minusaction: () {
                  setState(() {
                    BMI.age--;
                  });
                },
              ),
              PlusMinusCard(
                headingtext: 'Weight',
                ONSCREEN: BMI.weight,
                plusaction: () {
                  setState(() {
                    BMI.weight++;
                  });
                },
                minusaction: () {
                  setState(() {
                    BMI.weight--;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: FlatButton(
            color: Colors.red,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Screen1();
                }),
              );
            },
            child: Text(
              'Calculate',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
