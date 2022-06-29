import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark/constants/Constantcolors.dart';

class landingHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  Widget appName(BuildContext context) {
    return Positioned(
        top: 50.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SparK',
                style: TextStyle(
                    color: constantColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0),
              )
            ],
          ),
        ));
  }

  Widget signup(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              'SIGNUP',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: constantColors.whiteColor),
            ),
            SizedBox(height: 30.0),
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0)),
                    backgroundColor:
                        MaterialStateProperty.all(constantColors.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)))),
                child: Text('REGISTER',
                    style: TextStyle(
                        color: constantColors.lightDarkColor,
                        fontSize: 25.0,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.bold))),
            SizedBox(
              height: 40.0,
            ),
            Divider(
              thickness: 0.5,
              color: constantColors.whiteColor,
              indent: 20.0,
              endIndent: 20.0,
            ),
            SizedBox(
              height: 40.0,
            ),
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.fromLTRB(65.0, 15.0, 65.0, 15.0)),
                    backgroundColor:
                        MaterialStateProperty.all(constantColors.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)))),
                child: Text('LOGIN',
                    style: TextStyle(
                        color: constantColors.lightDarkColor,
                        fontSize: 25.0,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.bold)))
          ],
        ),
        decoration: BoxDecoration(
          color: constantColors.lightDarkColor,
          border: Border.all(color: constantColors.primaryColor, width: 3.0),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

  Widget background(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 1.0,
          width: MediaQuery.of(context).size.width * 1.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: constantColors.darkBlueColor,
            border: Border.all(color: constantColors.primaryColor, width: 2.0),
          ),
        )
      ],
    );
  }
}
