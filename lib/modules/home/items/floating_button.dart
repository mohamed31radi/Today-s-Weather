import 'package:flutter/material.dart';

class FloutingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {


      },
      backgroundColor: Colors.white,
      child: Icon(Icons.add, color: Colors.black),
      elevation: 0.0,);
  }
}
