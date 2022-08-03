import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:spark/constants/ConstantColors.dart';

showCustomWarningBox(BuildContext context,
    {required String title, required String description}) {
  return showGeneralDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CustomWarningBox(title: title, description: description);
      });
}

class CustomWarningBox extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  final double _borderRadius = 20.0;
  final String title, description;

  CustomWarningBox({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        backgroundColor: constantColors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius)),
        child: Stack(
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                width: _width,
                margin: const EdgeInsets.only(bottom: 10.0),
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: constantColors.primaryColor.withOpacity(0.05),
                    border: GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                      constantColors.primaryColor.withOpacity(0.4),
                      constantColors.primaryColor.withOpacity(0.0)
                    ])),
                    borderRadius: BorderRadius.circular(_borderRadius)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.white60,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white38),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        color: constantColors.whiteColor
                                            .withOpacity(0.3)))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                constantColors.whiteColor.withOpacity(0.1))),
                        onPressed: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "OK",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: constantColors.whiteColor,
                                letterSpacing: 1.6),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
