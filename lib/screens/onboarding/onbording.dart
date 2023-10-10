import 'package:evchstation/screens/onboarding/screen1.dart';
import 'package:evchstation/screens/onboarding/screen2.dart';
import 'package:evchstation/screens/onboarding/screen3.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  final swipecontroller = PageController();
  @override
  void dispose() {
    swipecontroller.dispose();
    //super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            //padding: EdgeInsets.only(bottom: screenHeight*0.01),
            child: PageView(
              controller: swipecontroller,
              children: [
                Container(
                  child: Screen1(),
                ),
                Container(
                  child: Screen2(),
                ),
                Container(
                  child: Screen3(),
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            height: screenHeight * 0.04,
            //color: Color(0xb266b5ff),
            //#28AAB1
            child: Center(
              child: SmoothPageIndicator(
                controller: swipecontroller,
                count: 3,
              ),
            ),
          ),
        ));
  }
}
