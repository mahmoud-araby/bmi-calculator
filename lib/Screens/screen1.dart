import 'package:bmi_calculator/Screens/screen0.dart';
import 'package:bmi_calculator/component/Reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(top: 28),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 30,
            child: BaseCard(
              colour: kBaseCardColor,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${BMI.Get_Result()}',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    '${BMI.calculate_bmi()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 72,
                    ),
                  ),
                  Text(
                    '${BMI.Get_speech()}',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                Navigator.pop(context);
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
      ),
    );
  }
}
