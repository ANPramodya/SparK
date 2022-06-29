import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:spark/constants/ConstantColors.dart';

class playButton extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
        glowColor: constantColors.primaryColor,
        duration: Duration(milliseconds: 1000),
        repeat: true,
        showTwoGlows: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        child: MaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          child: Container(
            width: 50.0,
            height: 50.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: constantColors.whiteColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: Text(
              'GO',
              style: TextStyle(
                  color: constantColors.lightDarkColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        endRadius: 100.0);
  }
}
