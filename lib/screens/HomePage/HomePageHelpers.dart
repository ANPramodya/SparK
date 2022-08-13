import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
          backgroundImage: NetworkImage(
              'https://drive.google.com/uc?export=view&id=1r8k_ojrHjSu9i5U-So99V0XZomPU4z_D'),
          radius: 35.0,
          backgroundColor: constantColors.transparent,
        )),
      ],
    );
  }

  Widget animatedBottomNavBar(
      BuildContext context, int pageIndex, PageController pageController) {
    return Theme(
      data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: constantColors.primaryColor)),
      child: CurvedNavigationBar(
        items: [
          Icon(
            EvaIcons.messageCircleOutline,
            color: pageIndex == 0
                ? constantColors.primaryColor
                : constantColors.whiteColor,
          ),
          Icon(
            EvaIcons.homeOutline,
            color: pageIndex == 1
                ? constantColors.primaryColor
                : constantColors.whiteColor,
          ),
          CircleAvatar(
            radius: 17.0,
            backgroundColor: pageIndex == 2
                ? constantColors.primaryColor
                : constantColors.transparent,
            child: CircleAvatar(
              radius: 15.0,
              backgroundColor: constantColors.blueColor,
              backgroundImage: NetworkImage(
                  'https://drive.google.com/uc?export=view&id=1r8k_ojrHjSu9i5U-So99V0XZomPU4z_D'),
            ),
          )
        ],
        height: 60.0,
        index: pageIndex,
        onTap: (val) {
          pageIndex = val;
          pageController.jumpToPage(val);
          notifyListeners();
        },
        backgroundColor: constantColors.transparent,
        animationDuration: Duration(milliseconds: 500),
        color: constantColors.lightDarkColor,
        buttonBackgroundColor: pageIndex == 2
            ? constantColors.transparent
            : constantColors.lightDarkColor,
        animationCurve: Curves.easeOut,
      ),
    );
  }
}
