import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/RegisterPage/RegisterPage3.dart';
import 'package:spark/widgets/CustomDialogBox.dart';
import 'package:spark/widgets/CustomWarning.dart';

class RegisterPage2 extends StatefulWidget {
  RegisterPage2({Key? key}) : super(key: key);

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

TextEditingController emailController = new TextEditingController();
TextEditingController get getEmailController => emailController;

class _RegisterPage2State extends State<RegisterPage2> {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: constantColors.darkColor,
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
                height: 510.0,
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
                          controller: emailController,
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
                              hintText: 'University Email Address',
                              hintStyle: TextStyle(
                                  color: constantColors.lightDarkColor,
                                  fontSize: 16.0,
                                  letterSpacing: 1.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    IconButton(
                        onPressed: () {
                          showCustomDialogBox(context,
                              title: "University Email Address",
                              description:
                                  "Type in the Email Address which university use to reach you");
                        },
                        icon: Icon(
                          FontAwesomeIcons.circleInfo,
                          color: constantColors.primaryColor,
                          size: 18.0,
                        )),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Send me Verification Code',
                      style: TextStyle(color: constantColors.whiteColor),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: AvatarGlow(
                          endRadius: 50.0,
                          glowColor: constantColors.primaryColor,
                          showTwoGlows: true,
                          child: Icon(
                            FontAwesomeIcons.circleChevronUp,
                            color: constantColors.primaryColor,
                            size: 30.0,
                          ),
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: constantColors.lightDarkColor,
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: constantColors.primaryColor, width: 1.0)),
                      height: 240.0,
                      width: 240.0,
                      child: Column(
                        children: [
                          SizedBox(height: 3.0),
                          Text(
                            'Verification',
                            style: TextStyle(
                                color: constantColors.whiteColor,
                                fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Form(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                cursorColor: constantColors.primaryColor,
                                cursorWidth: 12.0,
                                cursorRadius: Radius.circular(20.0),
                                maxLength: 4,
                                style: TextStyle(
                                    color: constantColors.primaryColor,
                                    fontSize: 18.0,
                                    letterSpacing: 12),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        borderSide: BorderSide(
                                            color:
                                                constantColors.primaryColor)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color:
                                                constantColors.primaryColor)),
                                    filled: true,
                                    fillColor: constantColors.darkColor,
                                    hintText: '4 Digit Code',
                                    hintStyle: TextStyle(
                                        color: constantColors.lightDarkColor,
                                        fontSize: 16.0,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                          AvatarGlow(
                            endRadius: 50.0,
                            glowColor: constantColors.primaryColor,
                            showTwoGlows: true,
                            child: FloatingActionButton(
                              onPressed: () {
                                final String email =
                                    emailController.text.trim();
                                if (email.isEmpty) {
                                  showCustomWarningBox(context,
                                      title: "Empty Field",
                                      description:
                                          "Please Enter University Email and get verified!"); //here comes a warning
                                } else {
                                  //additional check for verificationcode
                                  Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          child: RegisterPage3(),
                                          type:
                                              PageTransitionType.bottomToTop));
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
            ],
          ),
        ),
      ),
    );
  }
}
