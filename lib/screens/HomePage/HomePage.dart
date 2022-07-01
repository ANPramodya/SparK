import 'package:flutter/material.dart';
import 'package:spark/constants/ConstantColors.dart';

class HomePage extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constantColors.yellowColor,
        body: Center(
          child: Text(
            'Welcome',
            style: TextStyle(
                fontSize: 20.0,
                color: constantColors.whiteColor,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
