import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/Feed/FeedHelpers.dart';
import 'package:spark/utils/UploadPost.dart';
import 'package:spark/widgets/MenuWidget.dart';

import '../HomePage/HomePageHelpers.dart';

class Feed extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  final PageController homePageController = PageController();
  int pageIndex = 1;
  //const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: constantColors.darkColor,
      appBar: AppBar(
        leading: MenuWidget(),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<UploadPost>(context, listen: false)
                    .selectPostImage(context);
              },
              icon: Icon(FontAwesomeIcons.circlePlus))
        ],
        iconTheme: IconThemeData(color: constantColors.primaryColor),
        backgroundColor: constantColors.darkColor,
        title: Text(
          'Feed',
          style: TextStyle(color: constantColors.primaryColor, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Provider.of<FeedHelpers>(context, listen: false).feedBody(context),
      // bottomNavigationBar: Provider.of<HomePageHelpers>(context, listen: false)
      //     .animatedBottomNavBar(context, pageIndex, homePageController),
    );
  }
}
