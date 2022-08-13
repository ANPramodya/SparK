import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:spark/screens/login/loginPage.dart';
import 'package:spark/services/Authentication.dart';

import '../constants/ConstantColors.dart';

ConstantColors constantColors = ConstantColors();
logOutDialog(BuildContext context) {
  return showGeneralDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Dialog(
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            backgroundColor: constantColors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Stack(
              children: <Widget>[
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                        //visible container color
                        // gradient: const LinearGradient(
                        //     begin: Alignment.topLeft,
                        //     end: Alignment.bottomCenter,
                        //     colors: [Colors.white12, Colors.white10]),
                        color: constantColors.darkColor.withOpacity(0.15),
                        //border: Border.all(width: 2, color: Colors.white30),
                        border: GradientBoxBorder(
                            gradient: LinearGradient(colors: [
                          constantColors.primaryColor.withOpacity(0.4),
                          constantColors.primaryColor.withOpacity(0.0)
                        ])),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Log Out SparK?",
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 8.0, bottom: 20.0),
                          child: Divider(
                            thickness: 1.0,
                            color: Colors.white60,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: BorderSide(
                                                color: constantColors.whiteColor
                                                    .withOpacity(0.3)))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            constantColors.whiteColor
                                                .withOpacity(0.1))),
                                onPressed: () {
                                  Provider.of<Authentication>(context,
                                          listen: false)
                                      .logout()
                                      .whenComplete(() {
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            child: loginPage(),
                                            type: PageTransitionType
                                                .leftToRight));
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: constantColors.whiteColor,
                                        letterSpacing: 1.6),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: BorderSide(
                                                color: constantColors.whiteColor
                                                    .withOpacity(0.3)))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            constantColors.whiteColor
                                                .withOpacity(0.1))),
                                onPressed: () => Navigator.pop(context),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "No",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: constantColors.whiteColor,
                                        letterSpacing: 1.6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

// class CustomDialogBox extends StatelessWidget {
//   ConstantColors constantColors = ConstantColors();
//   final double _borderRadius = 20.0;
//   final String title, description;

//   CustomDialogBox({required this.title, required this.description});

//   @override
//   Widget build(BuildContext context) {
//     double _width = MediaQuery.of(context).size.width;
//     return WillPopScope(
//       onWillPop: () => Future.value(false),
//       child: Dialog(
//         elevation: 0,
//         clipBehavior: Clip.antiAlias,
//         backgroundColor: constantColors.transparent,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(_borderRadius)),
//         child: Stack(
//           children: <Widget>[
//             BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
//               child: Container(
//                 width: _width,
//                 margin: const EdgeInsets.only(bottom: 10.0),
//                 padding: const EdgeInsets.only(
//                     top: 20, bottom: 20, left: 20, right: 20),
//                 decoration: BoxDecoration(
//                     //visible container color
//                     // gradient: const LinearGradient(
//                     //     begin: Alignment.topLeft,
//                     //     end: Alignment.bottomCenter,
//                     //     colors: [Colors.white12, Colors.white10]),
//                     color: constantColors.darkColor.withOpacity(0.15),
//                     //border: Border.all(width: 2, color: Colors.white30),
//                     border: GradientBoxBorder(
//                         gradient: LinearGradient(colors: [
//                       constantColors.primaryColor.withOpacity(0.4),
//                       constantColors.primaryColor.withOpacity(0.0)
//                     ])),
//                     borderRadius: BorderRadius.circular(_borderRadius)),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       title,
//                       style: TextStyle(
//                           color: Colors.white54,
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
//                       child: Divider(
//                         thickness: 1.0,
//                         color: Colors.white60,
//                       ),
//                     ),
//                     Container(
//                         margin: const EdgeInsets.only(top: 10.0),
//                         child: Text(
//                           description,
//                           textAlign: TextAlign.center,
//                           style:
//                               TextStyle(fontSize: 16.0, color: Colors.white38),
//                         )),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25.0),
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30.0),
//                                     side: BorderSide(
//                                         color: constantColors.whiteColor
//                                             .withOpacity(0.3)))),
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                                 constantColors.whiteColor.withOpacity(0.1))),
//                         onPressed: () => Navigator.pop(context),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Text(
//                             "OK",
//                             style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                                 color: constantColors.whiteColor,
//                                 letterSpacing: 1.6),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
