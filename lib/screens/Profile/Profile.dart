import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spark/constants/ConstantColors.dart';

class Profile extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  //const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      appBar: AppBar(
        backgroundColor: constantColors.darkColor,
        title: Text(
          'SparK',
          style: TextStyle(color: constantColors.primaryColor, fontSize: 20.0),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              EvaIcons.settings2Outline,
              color: constantColors.primaryColor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                EvaIcons.logOutOutline,
                color: constantColors.primaryColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
