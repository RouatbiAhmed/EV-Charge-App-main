import 'package:evchstation/controller/Auth/authcontroller.dart';
import 'package:evchstation/view/home_screen.dart';
import 'package:evchstation/view/splash-screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class IsSignedIn extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.useremail != null ? const HomeScreen() : SplashScreen();
    });
  }
}