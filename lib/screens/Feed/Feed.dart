import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/Feed/FeedHelpers.dart';
import 'package:spark/widgets/MenuWidget.dart';

class Feed extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  //const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      appBar: AppBar(
        leading: MenuWidget(),
        iconTheme: IconThemeData(color: constantColors.primaryColor),
        backgroundColor: constantColors.darkColor,
        title: Text(
          'Feed',
          style: TextStyle(color: constantColors.primaryColor, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Provider.of<FeedHelpers>(context, listen: false).feedBody(context),
    );
  }
}
