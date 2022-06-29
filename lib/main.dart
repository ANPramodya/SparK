import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/LandingPage/landingHelpers.dart';
import 'package:spark/screens/SplashScreen/SplashScreen.dart';

void main() {
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
      providers: [ChangeNotifierProvider(create: (_) => landingHelpers())],
    );
  }
}