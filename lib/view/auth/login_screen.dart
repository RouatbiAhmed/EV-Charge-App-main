
import 'package:evchstation/controller/Auth/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

    final logincontroller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      
      body: Stack(children: [
        //app logo
        Positioned(
            top: screenHeight * .15,
            right: screenWidth * .25,
            width: screenWidth * .5,
            child: Lottie.asset("assets/slplash.json",
                height: 100, fit: BoxFit.cover, repeat: false)),

        //google login button
        Positioned(
            bottom: screenHeight * .15,
            left: screenWidth * .05,
            width: screenWidth * .9,
            height: screenHeight * .06,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor:const Color(0xFF28AAB1),
                    shape: const StadiumBorder(),
                    elevation: 1),
                onPressed: () {
                  logincontroller.google_signin();
                  //logincontroller.google_signOut();
                },
                //google icon
                icon: Image.asset('assets/google.png', height: screenHeight * .03),

                //login with google label
                label: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(text: 'Login with '),
                        TextSpan(
                            text: 'Google',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ]),
                ))),
      ]),
    );
  }
}
