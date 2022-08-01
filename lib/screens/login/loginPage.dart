import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/LandingPage/landingHelpers.dart';
import 'package:spark/screens/login/loginHelpers.dart';

class loginPage extends StatefulWidget {
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: Stack(
        children: [
          Provider.of<landingHelpers>(context, listen: false).appName(context),
          Provider.of<loginHelpers>(context, listen: false)
              .recentLogin(context),
        ],
      ),
    );
  }
}
