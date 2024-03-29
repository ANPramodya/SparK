import 'package:avatar_glow/avatar_glow.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/login/loginPage.dart';
import 'package:spark/services/Authentication.dart';
import 'package:spark/services/FirebaseOperations.dart';
import 'package:spark/widgets/CustomWarning.dart';

import 'RegisterPage2.dart';

class RegisterPage3 extends StatefulWidget {
  RegisterPage3({Key? key}) : super(key: key);

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  ConstantColors constantColors = ConstantColors();
  TextEditingController nameController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  bool _isObsecure = true;
  bool _isObsecureConfirm = true;
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constantColors.darkColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'SparK',
          style: TextStyle(
              color: constantColors.primaryColor,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 3.0),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              color: constantColors.primaryColor,
            )),
      ),
      backgroundColor: constantColors.darkColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: constantColors.lightDarkColor,
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: constantColors.primaryColor, width: 1.0)),
                height: 520.0,
                width: 270.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                          color: constantColors.whiteColor),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Form(
                        child: TextFormField(
                          controller: nameController,
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
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                  color: constantColors.lightDarkColor,
                                  fontSize: 16.0,
                                  letterSpacing: 1.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .0,
                    ),
                    Text(
                      'Name to be shown in the Profile',
                      style: TextStyle(
                          color: constantColors.whiteColor, fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Form(
                        child: TextFormField(
                          controller: usernameController,
                          enableSuggestions: false,
                          autocorrect: false,
                          cursorColor: constantColors.primaryColor,
                          style: TextStyle(
                              color: constantColors.primaryColor,
                              fontSize: 18.0,
                              letterSpacing: 1.5),
                          textAlign: TextAlign.center,
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
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      ////////////////////////////////////////////////////Password TextField
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: passwordController,
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
                                onPressed: () {
                                  setState(() {
                                    _isObsecure = !_isObsecure;
                                  });
                                },
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
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      ////////////////////////////////////////////////////Password TextField
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: _isObsecureConfirm,
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
                                onPressed: () {
                                  setState(() {
                                    _isObsecureConfirm = !_isObsecureConfirm;
                                  });
                                },
                                icon: Icon(
                                  _isObsecureConfirm
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
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              color: constantColors.lightDarkColor,
                              fontSize: 16.0,
                            )),
                      ),
                    ),
                    AvatarGlow(
                      endRadius: 50.0,
                      glowColor: constantColors.primaryColor,
                      showTwoGlows: true,
                      child: FloatingActionButton(
                        onPressed: () {
                          final String name = nameController.text.trim();
                          final NetworkImage defaultUserImage = NetworkImage(
                              'https://drive.google.com/uc?export=view&id=1r8k_ojrHjSu9i5U-So99V0XZomPU4z_D');
                          final String username =
                              usernameController.text.trim();
                          final String password =
                              passwordController.text.trim();
                          final String confirmPassword =
                              confirmPasswordController.text.trim();
                          if (name.isEmpty) {
                            showCustomWarningBox(context,
                                title: "Empty Field",
                                description: "Please Enter a profile name!");
                          } else {
                            if (username.isEmpty) {
                              showCustomWarningBox(context,
                                  title: "Empty Field",
                                  description: "Please Enter a username!");
                            } else {
                              if (password.isEmpty) {
                                showCustomWarningBox(context,
                                    title: "Empty Field",
                                    description: "Please Enter a password!");
                              } else {
                                if (confirmPassword.isEmpty) {
                                  showCustomWarningBox(context,
                                      title: "Empty Field",
                                      description:
                                          "Please Re-type the password");
                                } else {
                                  if (password != confirmPassword) {
                                    showCustomWarningBox(context,
                                        title: "Empty Field",
                                        description:
                                            "Entered passwords are not matching!\n Re-enter Password");
                                  } else {
                                    Provider.of<Authentication>(context,
                                            listen: false)
                                        .createAccount(
                                            getEmailController.text.trim(),
                                            password,
                                            username)
                                        .whenComplete(() {
                                      Provider.of<FirebaseOperations>(context,
                                              listen: false)
                                          .createUserCollection(context, {
                                        'useruid': Provider.of<Authentication>(
                                                context,
                                                listen: false)
                                            .getUserUid,
                                        'useremail':
                                            getEmailController.text.trim(),
                                        'username': username,
                                        // 'userimage':
                                        //     Provider.of<FirebaseOperations>(
                                        //             context,
                                        //             listen: false)
                                        //         .uploadUserAvatar(context),
                                        'name': name,
                                        'password': password
                                      });
                                      ;
                                    }).whenComplete(() {
                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                              child: loginPage(),
                                              type: PageTransitionType
                                                  .bottomToTop));
                                    });
                                  }
                                }
                              }
                            }
                          }
                        },
                        backgroundColor: constantColors.primaryColor,
                        child: Icon(
                          FontAwesomeIcons.arrowRight,
                          color: constantColors.lightDarkColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
