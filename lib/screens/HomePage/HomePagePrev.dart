import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/ChatRoom/ChatRoom.dart';
import 'package:spark/screens/Drawer/MenuItem.dart';
import 'package:spark/screens/Drawer/MenuPage.dart';
import 'package:spark/screens/Feed/Feed.dart';
import 'package:spark/screens/Feedback/Feedback.dart';
import 'package:spark/screens/HomePage/HomePage.dart';
import 'package:spark/screens/Policies/Policies.dart';
import 'package:spark/screens/Requests/Requests.dart';
import 'package:spark/screens/SettingsPage/Settings.dart';
import 'package:spark/screens/Statistics/Statistics.dart';

import '../../widgets/LogOutDialog.dart';
import '../LandingPage/landingPage.dart';

class HomePagePrev extends StatefulWidget {
  @override
  State<HomePagePrev> createState() => _HomePagePrevState();
}

class _HomePagePrevState extends State<HomePagePrev> {
  ConstantColors constantColors = ConstantColors();
  MenuItem2 currentItem = MenuItems.feed;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(builder: (context) {
        return MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            });
      }),
      mainScreen: getScreen(),
      showShadow: true,
      drawerShadowsBackgroundColor: constantColors.primaryColor,
      menuScreenWidth: MediaQuery.of(context).size.width,
      borderRadius: 30.0,
      mainScreenTapClose: true,
      angle: -15.0,
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.feed:
        return HomePage();
      case MenuItems.chat:
        return ChatRoom();
      case MenuItems.request:
        return Requests();
      case MenuItems.policies:
        return Policies();
      case MenuItems.statistics:
        return Statistics();
      case MenuItems.feedback:
        return FeedbackScreen();
      case MenuItems.settings:
        return Settings();
      case MenuItems.logout:
        return Feed();

      default:
        return HomePage();
    }
  }
}
