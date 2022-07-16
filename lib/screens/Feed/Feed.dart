import 'package:flutter/material.dart';
import 'package:spark/constants/ConstantColors.dart';

class Feed extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  //const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.yellowColor,
      body: Center(
        child: Text(
          'Feed',
          style: TextStyle(color: constantColors.whiteColor, fontSize: 25.0),
        ),
      ),
    );
  }
}
