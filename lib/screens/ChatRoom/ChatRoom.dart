import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/LandingPage/landingHelpers.dart';
import 'package:spark/widgets/CustomDialogBox.dart';
import 'package:spark/widgets/MenuWidget.dart';
import 'package:spark/widgets/RegisterTextField.dart';

import '../../widgets/CustomWarning.dart';
import '../HomePage/HomePageHelpers.dart';

class ChatRoom extends StatelessWidget {
  // final PageController homePageController = PageController();
  // int pageIndex = 0;
  ConstantColors constantColors = ConstantColors();
  //const ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      appBar: AppBar(
        leading: MenuWidget(),
        iconTheme: IconThemeData(color: constantColors.primaryColor),
        backgroundColor: constantColors.darkColor,
        title: Text(
          'Chats',
          style: TextStyle(color: constantColors.primaryColor, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(
                        'https://drive.google.com/uc?export=view&id=1Ooh2Qvw26Lecn2zKt-i0a5eYNO92R3ep'))),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                showCustomDialogBox(context,
                    title: "Welcome",
                    description: "Chatbox contains individual and group chats");
              },
              child: Text(
                'Chat Room',
                style:
                    TextStyle(color: constantColors.whiteColor, fontSize: 25.0),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Provider.of<HomePageHelpers>(context, listen: false)
      //     .animatedBottomNavBar(context, pageIndex, homePageController),
    );
  }
}
