import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  Color highcolour;
  Color bottomcolor;
  String text;
  String textWeather;
  String textNumber;
  String icon;

  ListItem({this.bottomcolor = Colors.black26,
    this.textNumber = '15',
    this.textWeather = 'Cloudy',
    this.highcolour = Colors.lightBlueAccent,
    this.text = 'Friday',
    this.icon = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bottomcolor, borderRadius: BorderRadius.circular(45)),
      height: 180,
      width: 116,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: highcolour,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              )),
          height: 85,
          width: 116,
        ),
        Positioned(top: 34, left: 37, child: Text(text)),
        Positioned(bottom: 50, right: 12, child: Icon(Icons.insert_link)),
        Positioned(bottom: 50, right: 60, child: Text(textNumber)),
        Positioned(bottom: 20, left: 20, child: Text(textWeather)),
      ]),
    );
  }
}
