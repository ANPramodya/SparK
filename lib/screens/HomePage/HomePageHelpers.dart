import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark/constants/ConstantColors.dart';

class HomePageHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  Widget bottomNavBar(
      BuildContext context, int index, PageController pageController) {
    return CustomNavigationBar(
      currentIndex: index,
      bubbleCurve: Curves.bounceIn,
      scaleCurve: Curves.decelerate,
      selectedColor: constantColors.primaryColor,
      unSelectedColor: constantColors.whiteColor,
      strokeColor: constantColors.redColor,
      scaleFactor: 0.5,
      iconSize: 25.0,
      onTap: (val) {
        index = val;
        pageController.jumpToPage(val);
        notifyListeners();
      },
      backgroundColor: constantColors.lightDarkColor,
      items: [
        CustomNavigationBarItem(icon: Icon(EvaIcons.messageCircle)),
        CustomNavigationBarItem(icon: Icon(EvaIcons.home)),
        CustomNavigationBarItem(
            icon: CircleAvatar(
          radius: 35.0,
          backgroundColor: constantColors.yellowColor,
          //backgroundImage: ,
        )),
      ],
    );
  }
}
