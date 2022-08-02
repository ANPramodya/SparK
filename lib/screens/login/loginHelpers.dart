import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/HomePage/HomePage.dart';
import 'package:spark/screens/HomePage/HomePagePrev.dart';
import 'package:spark/services/Authentication.dart';

class loginHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  TextEditingController loginUsernameController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();
  bool _isObsecure = true;
  bool value = true;

  Widget recentLogin(BuildContext context) {
    return Positioned(
      top: 150.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CircleAvatar(
              radius: 52.0,
              backgroundColor: constantColors.primaryColor,
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: constantColors.blueColor,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
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
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Login Account',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: constantColors.whiteColor),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    ////////////////////////////////////////////////////////Username textField
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      controller: loginUsernameController,
                      style: TextStyle(
                          color: constantColors.primaryColor,
                          fontSize: 18.0,
                          letterSpacing: 1.5),
                      textAlign: TextAlign.center,
                      cursorColor: constantColors.primaryColor,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                  color: constantColors.primaryColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: constantColors.primaryColor)),
                          filled: true,
                          fillColor: constantColors.darkColor,
                          hintText: 'Username',
                          hintStyle: TextStyle(
                              color: constantColors.lightDarkColor,
                              fontSize: 16.0,
                              letterSpacing: 1.0)),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    ////////////////////////////////////////////////////Password TextField
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: loginPasswordController,
                      obscureText: _isObsecure,
                      enableSuggestions: false,
                      autocorrect: false,
                      cursorColor: constantColors.primaryColor,
                      style: TextStyle(
                          color: constantColors.primaryColor,
                          fontSize: 18.0,
                          letterSpacing: 1.5),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                _isObsecure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: constantColors.lightDarkColor,
                              )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: constantColors.primaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                  color: constantColors.primaryColor)),
                          filled: true,
                          fillColor: constantColors.darkColor,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: constantColors.lightDarkColor,
                            fontSize: 16.0,
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: this.value,
                        onChanged: null,
                        checkColor: constantColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        side: MaterialStateBorderSide.resolveWith((states) =>
                            BorderSide(
                                width: 1.0,
                                color: constantColors.primaryColor)),
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                            color: constantColors.primaryColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0),
                      )
                    ],
                  ),
                  AvatarGlow(
                    endRadius: 50.0,
                    glowColor: constantColors.primaryColor,
                    showTwoGlows: true,
                    child: FloatingActionButton(
                      onPressed: () async {
                        if (loginUsernameController.text.isEmpty) {
                          print("username empty");
                        } else {
                          if (loginPasswordController.text.isEmpty) {
                            print("password empty");
                          } else {
                            QuerySnapshot snapshot = await FirebaseFirestore
                                .instance
                                .collection('users')
                                .where("username",
                                    isEqualTo:
                                        loginUsernameController.text.trim())
                                .get();
                            Provider.of<Authentication>(context, listen: false)
                                .logIntoAccount(snapshot.docs[0]['useremail'],
                                    loginPasswordController.text.trim())
                                .whenComplete(() {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: HomePagePrev(),
                                      type: PageTransitionType.bottomToTop));
                            });
                          }
                        }
                      },
                      backgroundColor: constantColors.primaryColor,
                      child: Icon(
                        FontAwesomeIcons.fingerprint,
                        color: constantColors.lightDarkColor,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: constantColors.primaryColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
