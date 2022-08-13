import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:spark/services/Authentication.dart';

import '../screens/LandingPage/landingUtils.dart';

class FirebaseOperations with ChangeNotifier {
  late UploadTask imageUploadTask;
  late String initUserName, initUserEmail, initUserImage;
  String get getInitUserName => initUserName;
  String get getInitUserEmail => initUserEmail;
  String get getInitUserImage => initUserImage;

  Future createUserCollection(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(Provider.of<Authentication>(context, listen: false).getUserUid)
        .set(data);
  }

  // Future UploadUserAvatar() async{
  //   Reference imageRefernce = FirebaseStorage.instance.ref().child('userProfileAvatar/${}');
  // }

  Future initUserData(BuildContext context) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<Authentication>(context, listen: false).getUserUid)
        .get()
        .then((doc) {
      print('Fetching User data');
      initUserName = doc.data()!['name'];
      initUserEmail = doc.data()!['useremail'];
      //initUserImage = doc.data()!['userimage'];not uploaded
      print(initUserName);
      print(initUserEmail);
      //print(initUserImage);
      notifyListeners();
    });
  }

  Future UploadPostData(String postId, dynamic data) async {
    return FirebaseFirestore.instance.collection('posts').doc(postId).set(data);
  }

  Future uploadUserImage(BuildContext context) async {
    Reference imageRefernce = FirebaseStorage.instance.ref().child(
        'UserProfileImage/${Provider.of<landingUtils>(context, listen: false).getUserImage.path}/${TimeOfDay.now()}');
    imageUploadTask = imageRefernce.putFile(
        Provider.of<landingUtils>(context, listen: false).getUserImage);
    await imageUploadTask.whenComplete(() {
      print("imageuploaded successfully");
    });
    imageRefernce.getDownloadURL().then((value) {
      Provider.of<landingUtils>(context, listen: false).userImageUrl =
          value.toString();
      notifyListeners();
    });
  }

  Future uploadUserAvatar(BuildContext context) async {
    var pathRef = FirebaseStorage.instance
        .ref('gs://spark-e096e.appspot.com/defaultProfile.jpg');
  }
}
