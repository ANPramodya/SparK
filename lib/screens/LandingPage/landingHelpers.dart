import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spark/constants/Constantcolors.dart';
import 'package:spark/screens/RegisterPage/RegisterPage1.dart';
import 'package:spark/screens/login/loginPage.dart';

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
                    fontSize: 40.0,
                    letterSpacing: 3.0),
              )
            ],
          ),
        ));
  }

  Widget signup(BuildContext context) {
    return Positioned(
        top: 200.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: constantColors.lightDarkColor,
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: constantColors.primaryColor, width: 1.0)),
                height: 400.0,
                width: 270.0,
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          color: constantColors.whiteColor),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: RegisterPage1(),
                                type: PageTransitionType.rightToLeft));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            constantColors.primaryColor),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                      ),
                      child: Container(
                        height: 25.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: constantColors.darkColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        thickness: 1.0,
                        color: constantColors.whiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: loginPage(),
                                type: PageTransitionType.fade));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            constantColors.primaryColor),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                      ),
                      child: Container(
                        height: 25.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: constantColors.darkColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
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
