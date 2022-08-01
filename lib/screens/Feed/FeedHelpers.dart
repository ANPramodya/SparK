import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';

import '../../widgets/MenuWidget.dart';

class FeedHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  Widget feedBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,

          // child: new ListView(
          //   children: ,
          // ),
          // child: StreamBuilder(
          //   stream: PostItems.posts.map().toList(),
          //   builder: ,
          // ),
          //return loadposts
          decoration: BoxDecoration(
              color: constantColors.yellowColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
        ),
      ),
    );
  }

  // Widget loadPosts(BuildContext context) {
  //   return ListView(
  //       //list of object not passed
  //       children: postss.map((e) {
  //     return Container(
  //       height: MediaQuery.of(context).size.height * 0.6,
  //       width: MediaQuery.of(context).size.width,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Row(
  //             children: [
  //               GestureDetector(
  //                 child: CircleAvatar(
  //                   backgroundColor: constantColors.transparent,
  //                   radius: 20.0,
  //                   backgroundImage: NetworkImage(
  //                       "${e.profileLink}"), //image from the list NetworkImage
  //                 ),
  //               ),
  //               Container(
  //                 width: MediaQuery.of(context).size.width * 0.6,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Container(
  //                       child: Text("${e.name}"), //username from the list
  //                     ),
  //                     Container(
  //                       child: Text("${e.caption}"), //caption from the list
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //           Container(
  //             height: MediaQuery.of(context).size.height * 0.46,
  //             width: MediaQuery.of(context).size.width,
  //             child: FittedBox(
  //               child: Image.network("${e.postLink}"), //postimage from the list
  //             ),
  //           ),
  //           Row(
  //             children: [
  //               Container(
  //                 width: 80.0, //use Mediaquery

  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     GestureDetector(child: Icon(FontAwesomeIcons.thumbsUp)),
  //                     Text("0", style: TextStyle(fontSize: 14.0))
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 width: 80.0, //use Mediaquery
  //                 child: Row(
  //                   children: [
  //                     GestureDetector(child: Icon(FontAwesomeIcons.thumbsUp)),
  //                     Text("0", style: TextStyle(fontSize: 14.0))
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 width: 80.0, //use Mediaquery
  //                 child: Row(
  //                   children: [
  //                     GestureDetector(child: Icon(FontAwesomeIcons.thumbsUp)),
  //                     Text("0", style: TextStyle(fontSize: 14.0))
  //                   ],
  //                 ),
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     );
  //   }).toList());
  // }
}
