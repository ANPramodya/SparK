import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/Drawer/MenuItem.dart';

class MenuItems {
  static const feed = MenuItem2('Feed', Icons.home_outlined);
  static const chat = MenuItem2('Chat', Icons.message_outlined);
  static const request = MenuItem2('Requests', Icons.notifications_outlined);
  static const settings = MenuItem2('Settings', Icons.settings_outlined);
  static const policies = MenuItem2('Policies', Icons.feedback_outlined);
  static const statistics = MenuItem2('Statistics', Icons.bar_chart_outlined);
  static const feedback = MenuItem2('Feedback', Icons.feedback_outlined);
  static const logout = MenuItem2('Logout', Icons.lock_outline);

  static const all = <MenuItem2>[
    feed,
    chat,
    request,
    settings,
    policies,
    statistics,
    feedback,
    logout
  ];
}

class MenuPage extends StatelessWidget {
  final MenuItem2 currentItem;
  final ValueChanged<MenuItem2> onSelectedItem;
  final ConstantColors constantColors = ConstantColors();

  MenuPage(
      {super.key, required this.currentItem, required this.onSelectedItem});

  Widget buildMenuItem(MenuItem2 item) => ListTileTheme(
        selectedColor: constantColors.whiteColor,
        child: ListTile(
          selectedTileColor: Colors.black26,
          selected: currentItem == item,
          minLeadingWidth: 20.0,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () {
            onSelectedItem(item);
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        //backgroundColor: constantColors.yellowColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(),
              UserAccountsDrawerHeader(
                accountName: Text("Pramodya@98"),
                accountEmail: Text("anpramodya@gmail.com"),
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
              Spacer(),
              ...MenuItems.all.map(buildMenuItem).toList(),
              Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
