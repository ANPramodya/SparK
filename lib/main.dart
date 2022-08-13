import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/Feed/FeedHelpers.dart';
import 'package:spark/screens/HomePage/HomePageHelpers.dart';
import 'package:spark/screens/LandingPage/landingHelpers.dart';
import 'package:spark/screens/LandingPage/landingUtils.dart';
import 'package:spark/screens/SplashScreen/SplashScreen.dart';
import 'package:spark/screens/login/loginHelpers.dart';
import 'package:spark/services/Authentication.dart';
import 'package:spark/services/FirebaseOperations.dart';
import 'package:spark/utils/UploadPost.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    ConstantColors constantcolors = ConstantColors();
    return MultiProvider(
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            accentColor: constantcolors.darkColor,
            fontFamily: 'Poppins',
            canvasColor: constantcolors.transparent),
      ),
      providers: [
        ChangeNotifierProvider(create: (_) => landingUtils()),
        ChangeNotifierProvider(create: (_) => UploadPost()),
        ChangeNotifierProvider(create: (_) => FirebaseOperations()),
        ChangeNotifierProvider(create: (_) => Authentication()),
        ChangeNotifierProvider(create: (_) => FeedHelpers()),
        ChangeNotifierProvider(create: (_) => HomePageHelpers()),
        ChangeNotifierProvider(create: (_) => landingHelpers()),
        ChangeNotifierProvider(create: (_) => loginHelpers()),
      ],
    );
  }
}
