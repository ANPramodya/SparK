import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/Constantcolors.dart';
import 'package:spark/screens/LandingPage/landingHelpers.dart';

class landingPage extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: Stack(
        children: [
          Provider.of<landingHelpers>(context, listen: false)
              .background(context),
          Provider.of<landingHelpers>(context, listen: false).appName(context),
          Provider.of<landingHelpers>(context, listen: false).signup(context),
        ],
      ),
    );
  }
}
