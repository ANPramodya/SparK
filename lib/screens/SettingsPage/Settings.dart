import 'package:flutter/material.dart';
import 'package:spark/widgets/MenuWidget.dart';

import '../../constants/ConstantColors.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      appBar: AppBar(
        leading: MenuWidget(),
        iconTheme: IconThemeData(color: constantColors.primaryColor),
        backgroundColor: constantColors.darkColor,
        title: Text(
          'Settings',
          style: TextStyle(color: constantColors.primaryColor, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Settings',
          style: TextStyle(color: constantColors.whiteColor, fontSize: 25.0),
        ),
      ),
    );
  }
}
