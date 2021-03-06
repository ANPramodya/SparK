import 'package:flutter/material.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/widgets/MenuWidget.dart';
import 'package:spark/widgets/RegisterTextField.dart';

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
      body: Center(
        child: Text(
          'Chat Room',
          style: TextStyle(color: constantColors.whiteColor, fontSize: 25.0),
        ),
      ),
    );
  }
}
