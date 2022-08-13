import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:spark/services/FirebaseOperations.dart';

class landingUtils with ChangeNotifier {
  final picker = ImagePicker();
  late File userImage;
  File get getUserImage => userImage;
  late String userImageUrl;
  String get getUserImageUrl => userImageUrl;

  Future pickUserImage(BuildContext context, ImageSource source) async {
    final pickedUserImage = await picker.getImage(source: source);
    pickedUserImage == null
        ? print("Select Image")
        : userImage = File(pickedUserImage.path);
    print(userImage.path);
    userImage != null
        ? Provider.of<FirebaseOperations>(context, listen: false)
            .uploadUserImage(context)
        : print("imageupload error");
    notifyListeners();
  }
}
