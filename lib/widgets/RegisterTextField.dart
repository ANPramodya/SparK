import 'package:flutter/material.dart';
import 'package:spark/constants/ConstantColors.dart';

ConstantColors constantColors = ConstantColors();

class RegisterTextField extends StatelessWidget {
  final String hintText;

  const RegisterTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          color: constantColors.primaryColor,
          fontSize: 18.0,
          letterSpacing: 1.5),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(color: constantColors.primaryColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide:
                  BorderSide(width: 1, color: constantColors.primaryColor)),
          filled: true,
          fillColor: constantColors.darkColor,
          hintText: hintText,
          hintStyle: TextStyle(
              color: constantColors.lightDarkColor,
              fontSize: 16.0,
              letterSpacing: 1.0)),
    );
  }
}
