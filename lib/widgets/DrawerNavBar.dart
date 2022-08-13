import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/widgets/LogOutDialog.dart';
import 'package:spark/widgets/RegisterTextField.dart';

class DrawerNavBar extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: constantColors.darkColor,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('SparkDeveloper98'),
            accountEmail: Text('anpramodya@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://drive.google.com/uc?export=view&id=1ThNjawR_F1DmBTz5xoAmHJY31tMl9pwZ',
                  width: 90.0,
                  height: 90.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://drive.google.com/uc?export=view&id=17pcOy_PktSIc8F65z-s3oLkrBgiB5mIv'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(
              EvaIcons.homeOutline,
              color: constantColors.primaryColor,
            ),
            title: Text(
              'Feed',
              style:
                  TextStyle(color: constantColors.whiteColor, fontSize: 16.0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              EvaIcons.messageCircleOutline,
              color: constantColors.primaryColor,
            ),
            title: Text(
              'Chat',
              style:
                  TextStyle(color: constantColors.whiteColor, fontSize: 16.0),
            ),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Divider(
              color: constantColors.primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(
              EvaIcons.bellOutline,
              color: constantColors.primaryColor,
            ),
            title: Text(
              'Requests',
              style:
                  TextStyle(color: constantColors.whiteColor, fontSize: 16.0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              EvaIcons.settings2Outline,
              color: constantColors.primaryColor,
            ),
            title: Text(
              'Settings',
              style:
                  TextStyle(color: constantColors.whiteColor, fontSize: 16.0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              EvaIcons.barChart2Outline,
              color: constantColors.primaryColor,
            ),
            title: Text(
              'Policies',
              style:
                  TextStyle(color: constantColors.whiteColor, fontSize: 16.0),
            ),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Divider(
              color: constantColors.primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(
              EvaIcons.messageSquareOutline,
              color: constantColors.primaryColor,
            ),
            title: Text(
              'Feedback',
              style:
                  TextStyle(color: constantColors.whiteColor, fontSize: 16.0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              EvaIcons.logOutOutline,
              color: constantColors.primaryColor,
            ),
            title: Text(
              'LogOut',
              style:
                  TextStyle(color: constantColors.whiteColor, fontSize: 16.0),
            ),
            onTap: () {
              logOutDialog(context);
            },
          )
        ],
      ),
    );
  }
}
