import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/services/Authentication.dart';
import 'package:spark/services/FirebaseOperations.dart';

import '../../widgets/MenuWidget.dart';

class FeedHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  Widget feedBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
        ),
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SizedBox(
                    height: 500.0,
                    width: 400.0,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return loadPosts(context, snapshot);
              }
            },
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: constantColors.darkColor,
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      'https://drive.google.com/uc?export=view&id=1Ooh2Qvw26Lecn2zKt-i0a5eYNO92R3ep'),
                  scale: 0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
        ),
      ),
    );
  }

  Widget loadPosts(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildBlur(
              sigmaX: 5.0,
              sigmaY: 5.0,
              child: Container(
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                      constantColors.primaryColor.withOpacity(0.4),
                      constantColors.primaryColor.withOpacity(0.0)
                    ])),
                    borderRadius: BorderRadius.circular(50.0),
                    color: constantColors.lightDarkColor.withOpacity(0.5)),
                //color: constantColors.lightDarkColor,
                //height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 25.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              backgroundColor: constantColors.transparent,
                              radius: 20.0,
                              //backgroundImage: NetworkImage(documentSnapshot.data()['userimage']),
                              backgroundImage: NetworkImage(
                                  'https://drive.google.com/uc?export=view&id=19Ixk-Dvr0T9iwAHhQVy5ZPEJ1Ia4xnGr'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        child: Text(
                                      documentSnapshot['name'],
                                      style: TextStyle(
                                          color: constantColors.whiteColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    Container(
                                      child: Text('12 hrs ago',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: constantColors.whiteColor
                                                  .withOpacity(0.8))),
                                    ),
                                    Container(
                                      child: Text(
                                        documentSnapshot['caption'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                            color: constantColors.whiteColor),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Provider.of<Authentication>(context, listen: false)
                                      .getUserUid ==
                                  documentSnapshot['useruid'] //.data()
                              ? IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    EvaIcons.moreVertical,
                                    color: constantColors.whiteColor,
                                  ))
                              : Container(
                                  width: 0.0,
                                  height: 0.0,
                                ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.93,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        documentSnapshot['postimage'],
                                        scale: 0.1,
                                        fit: BoxFit.fill,
                                      ),
                                      buildBlur(
                                        sigmaX: 50.0,
                                        sigmaY: 50.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  constantColors.transparent),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 40.0, top: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width: 80.0,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      GestureDetector(
                                                        child: Icon(
                                                          FontAwesomeIcons
                                                              .thumbsUp,
                                                          color: constantColors
                                                              .primaryColor,
                                                          size: 22.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Text(
                                                          '0',
                                                          style: TextStyle(
                                                              color:
                                                                  constantColors
                                                                      .whiteColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18.0),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 80.0,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      GestureDetector(
                                                        child: Icon(
                                                          FontAwesomeIcons
                                                              .comment,
                                                          color: constantColors
                                                              .primaryColor,
                                                          size: 22.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Text(
                                                          '0',
                                                          style: TextStyle(
                                                              color:
                                                                  constantColors
                                                                      .whiteColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18.0),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 80.0,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      GestureDetector(
                                                        child: Icon(
                                                          FontAwesomeIcons
                                                              .share,
                                                          color: constantColors
                                                              .primaryColor,
                                                          size: 22.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Text(
                                                          '0',
                                                          style: TextStyle(
                                                              color:
                                                                  constantColors
                                                                      .whiteColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18.0),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildBlur(
          {required Widget child,
          required double sigmaX,
          required double sigmaY}) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: child,
        ),
      );
}
