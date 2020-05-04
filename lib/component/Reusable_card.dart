import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'FloatingButton.dart';

class ReusbleCard extends StatelessWidget {
  final String text;
  final icon;
  final color;
  final Function action;
  ReusbleCard({this.text, this.icon, this.color, this.action});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: action,
        child: BaseCard(
            colour: color,
            CardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: kReusableCardIconSize,
                ),
                Text(
                  '$text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class SliderCard extends StatefulWidget {
  SliderCard({this.heading, this.ON_SCREEN, @required this.Action});
  final Function Action;
  final ON_SCREEN;
  final heading;
  @override
  _SliderCardState createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  @override
  Widget build(BuildContext context) {
    return BaseCard(
      colour: kBaseCardColor,
      CardChild: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${widget.heading}', style: KMainTextStyle),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0x55EB1555),
                activeTrackColor: Color(0xFFEB1555),
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x88EB1555),
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 13,
                ),
                overlayShape: RoundSliderOverlayShape(),
              ),
              child: Slider(
                min: 0,
                max: 200,
                value: widget.ON_SCREEN.toDouble(),
                onChanged: (double newValue) {
                  widget.Action(newValue);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  '${widget.ON_SCREEN.toString()}',
                  style: KMainTextStyle,
                ),
                Text(' cm'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlusMinusCard extends StatefulWidget {
  PlusMinusCard(
      {this.ONSCREEN,
      this.headingtext,
      this.plusaction,
      this.minusaction,
      this.plusIcon,
      this.MisnusIcon});

  final plusIcon;
  final MisnusIcon;
  final ONSCREEN;
  final String headingtext;
  final Function plusaction;
  final Function minusaction;
  @override
  _PlusMinusCardState createState() => _PlusMinusCardState();
}

class _PlusMinusCardState extends State<PlusMinusCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseCard(
        colour: kBaseCardColor,
        CardChild: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${widget.headingtext}', style: KMainTextStyle),
            Text('${widget.ONSCREEN.toString()}', style: KMainTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FloatingButton(
                  action: widget.minusaction,
                  ButtonChild: Icon(
                    FontAwesomeIcons.minus,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
                FloatingButton(
                  action: widget.plusaction,
                  ButtonChild: Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BaseCard extends StatelessWidget {
  /// ignore: non_constant_identifier_names
  final CardChild;
  final colour;
  BaseCard({this.CardChild, this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15),
        ),
        child: CardChild);
  }
}
