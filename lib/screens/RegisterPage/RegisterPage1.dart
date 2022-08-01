import 'package:avatar_glow/avatar_glow.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:spark/constants/ConstantColors.dart';
import 'package:spark/screens/LandingPage/landingHelpers.dart';
import 'package:spark/screens/LandingPage/landingPage.dart';
import 'package:spark/screens/RegisterPage/RegisterPage2.dart';

class RegisterPage1 extends StatefulWidget {
  @override
  State<RegisterPage1> createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  ConstantColors constantColors = ConstantColors();
  final List<String> Universities = [
    'University of Kelaniya',
    'University of Moratuwa',
    'University of Peradeniya',
    'University of Ruhuna',
    'University of Jayawardanpura',
    'University of Jaffna',
  ];

  final List<String> Faculties = [
    'Faculty of Science',
    'Faculty of Humanities',
    'Faculty of Commerce',
    'Faculty of Medicine',
    'Faculty of Engineering',
    'Faculty of Arts',
  ];

  String? selectedValueUni;
  final TextEditingController UniversityTextEdittingController =
      TextEditingController();

  String? selectedValueFac;
  final TextEditingController FacultyTextEdittingController =
      TextEditingController();

  @override
  void disposeUni() {
    UniversityTextEdittingController.dispose();
    super.dispose();
  }

  @override
  void disposefac() {
    FacultyTextEdittingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constantColors.darkColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'SparK',
          style: TextStyle(
              color: constantColors.primaryColor,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 3.0),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              color: constantColors.primaryColor,
            )),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: constantColors.darkColor,
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: constantColors.lightDarkColor,
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: constantColors.primaryColor, width: 1.0)),
                height: 500.0,
                width: 270.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                          color: constantColors.whiteColor),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Form(
                        child: TextFormField(
                          style: TextStyle(
                              color: constantColors.primaryColor,
                              fontSize: 18.0,
                              letterSpacing: 1.5),
                          textAlign: TextAlign.center,
                          cursorColor: constantColors.primaryColor,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(
                                      color: constantColors.primaryColor)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: constantColors.primaryColor)),
                              filled: true,
                              fillColor: constantColors.darkColor,
                              hintText: 'Full Name',
                              hintStyle: TextStyle(
                                  color: constantColors.lightDarkColor,
                                  fontSize: 16.0,
                                  letterSpacing: 1.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.circleInfo,
                          color: constantColors.primaryColor,
                          size: 18.0,
                        )),
                    SizedBox(
                      height: 5.0,
                    ),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2(
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          FontAwesomeIcons.angleDown,
                          color: constantColors.primaryColor,
                          size: 16.0,
                        ),
                      ),
                      style: TextStyle(color: constantColors.primaryColor),
                      dropdownDecoration: BoxDecoration(
                          color: constantColors.darkColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      isExpanded: true,
                      buttonDecoration: BoxDecoration(
                          color: constantColors.darkColor,
                          borderRadius: BorderRadius.circular(50.0)),
                      hint: Center(
                        child: Text(
                          'University',
                          style: TextStyle(
                            fontSize: 16,
                            color: constantColors.lightDarkColor,
                          ),
                        ),
                      ),
                      items:
                          Universities.map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Center(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: constantColors.lightDarkColor),
                                  ),
                                ),
                              )).toList(),
                      value: selectedValueUni,
                      onChanged: (value) {
                        setState(() {
                          selectedValueUni = value as String;
                        });
                      },
                      buttonHeight: 65.0,
                      buttonWidth: 250,
                      itemHeight: 50,
                      dropdownMaxHeight: 200,
                      searchController: UniversityTextEdittingController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          controller: UniversityTextEdittingController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: constantColors.darkColor,
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for an item...',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: constantColors.lightDarkColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          UniversityTextEdittingController.clear();
                        }
                      },
                    )),
                    SizedBox(
                      height: 15.0,
                    ),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2(
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          FontAwesomeIcons.angleDown,
                          color: constantColors.primaryColor,
                          size: 16.0,
                        ),
                      ),
                      dropdownDecoration: BoxDecoration(
                          color: constantColors.darkColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      isExpanded: true,
                      buttonDecoration: BoxDecoration(
                          color: constantColors.darkColor,
                          borderRadius: BorderRadius.circular(50.0)),
                      hint: Center(
                        child: Text(
                          'Faculty',
                          style: TextStyle(
                            fontSize: 16,
                            color: constantColors.lightDarkColor,
                          ),
                        ),
                      ),
                      items: Faculties.map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Center(
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: constantColors.lightDarkColor),
                              ),
                            ),
                          )).toList(),
                      value: selectedValueFac,
                      onChanged: (value) {
                        setState(() {
                          selectedValueFac = value as String;
                        });
                      },
                      buttonHeight: 65.0,
                      buttonWidth: 250,
                      itemHeight: 50,
                      dropdownMaxHeight: 200,
                      searchController: FacultyTextEdittingController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          controller: FacultyTextEdittingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for an item...',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: constantColors.lightDarkColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          FacultyTextEdittingController.clear();
                        }
                      },
                    )),
                    SizedBox(
                      height: 50.0,
                    ),
                    AvatarGlow(
                      endRadius: 50.0,
                      glowColor: constantColors.primaryColor,
                      showTwoGlows: true,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: RegisterPage2(),
                                  type: PageTransitionType.bottomToTop));
                        },
                        backgroundColor: constantColors.primaryColor,
                        child: Icon(
                          FontAwesomeIcons.arrowRight,
                          color: constantColors.lightDarkColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
