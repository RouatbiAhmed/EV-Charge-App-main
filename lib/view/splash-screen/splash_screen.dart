import 'package:evchstation/view/onboarding/onbording.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => OnBoarding()); 
    });

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          //app logo
          Positioned(
            top: screenHeight * .15,
            right: screenWidth * .27,
            width: screenWidth * .5,
            child: Lottie.asset(
              "assets/slplash.json",
              height: 230,
              fit: BoxFit.cover,
              repeat: false,
            ),
          ),
          Positioned(
            bottom: screenHeight * .15,
            width: screenWidth,
            child: const Text(
              'Save Energy ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
