import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/ChatRoom/ChatRoom.dart';
import 'package:spark/screens/Feed/Feed.dart';
import 'package:spark/screens/HomePage/HomePageHelpers.dart';
import 'package:spark/screens/Profile/Profile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConstantColors constantColors = ConstantColors();
  final PageController homePageController = PageController();
  int pageIndex = 0;

  /**@override
  void initState() {
    super.initState();
    Provider.of<firebaseOperations>(context, listen: false)
        .initUserData(context);
    super.initState();
  }**/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: constantColors.darkColor,
      body: PageView(
        controller: homePageController,
        children: [ChatRoom(), Feed(), Profile()],
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
      ),
      // bottomNavigationBar: Provider.of<HomePageHelpers>(context, listen: false)
      //   .bottomNavBar(context, pageIndex, homePageController),
      bottomNavigationBar: Provider.of<HomePageHelpers>(context, listen: false)
          .animatedBottomNavBar(context, pageIndex, homePageController),
    );
  }
}
