import 'package:evchstation/view/onboarding/screen1.dart';
import 'package:evchstation/view/onboarding/screen2.dart';
import 'package:evchstation/view/onboarding/screen3.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  final swipecontroller = PageController();
  void dispose() {
    swipecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: PageView(
            controller: swipecontroller,
            children: const [
              Screen3(),
              Screen1(),
              Screen2(),
            ],
          ),
          bottomSheet: Container(
            height: screenHeight * 0.04,
            color:const Color(0x28AAB1),
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
