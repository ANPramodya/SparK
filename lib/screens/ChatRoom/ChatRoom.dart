import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/LandingPage/landingHelpers.dart';
import 'package:spark/widgets/CustomDialogBox.dart';
import 'package:spark/widgets/MenuWidget.dart';
import 'package:spark/widgets/RegisterTextField.dart';

import '../../widgets/CustomWarning.dart';

class ChatRoom extends StatelessWidget {
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
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: constantColors.primaryColor,
              border:
                  Border.all(color: constantColors.primaryColor, width: 2.0),
            ),
          ),
          Positioned(
            top: 200.0,
            left: 200.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: constantColors.primaryColor,
                border:
                    Border.all(color: constantColors.primaryColor, width: 2.0),
              ),
            ),
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
    );
  }
}
