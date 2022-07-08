import 'package:flutter/material.dart';
import 'package:spark/constants/ConstantColors.dart';

class RegisterPage2 extends StatefulWidget {
  RegisterPage2({Key? key}) : super(key: key);

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: constantColors.darkColor,
    );
  }
}
