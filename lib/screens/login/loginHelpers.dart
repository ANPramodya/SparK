import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark/constants/ConstantColors.dart';

class loginHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  Widget recentLogin(BuildContext context) {
    return Positioned(
        top: 150.0,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: constantColors.blueColor,
              radius: 50.0,
            )
          ],
        ));
  }
}
