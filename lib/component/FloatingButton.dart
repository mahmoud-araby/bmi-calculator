import 'package:flutter/material.dart';

import '../constants.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton({this.action, @required this.ButtonChild});
  final ButtonChild;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 20,
      constraints: BoxConstraints.tightFor(
        height: 50,
        width: 50,
      ),
      onPressed: action,
      fillColor: ButtonColors,
      child: ButtonChild,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
