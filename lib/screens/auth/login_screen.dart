//login screen -- implements google sign in or sign up feature for app

import 'package:evchstation/controller/Auth/logincontroller.dart';
import 'package:evchstation/home_screen.dart';
import 'package:evchstation/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final logincontroller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    //initializing media query (for getting device screen size)
    mq = MediaQuery.of(context).size;

    return Scaffold(
      //app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Ev charge station'),
      ),

      //body
      body: Stack(children: [
        //app logo
        /*  AnimatedPositioned(
            top: mq.height * .15,
            right: _isAnimate ? mq.width * .25 : -mq.width * .5,
            width: mq.width * .5,
            duration: const Duration(seconds: 1),
            child: Image.asset('images/icon.png')),*/

        //app logo
        /* Positioned(
            top: mq.height * .18,
            right: mq.width * .10,
            width: mq.width * .8,
            child: Image.asset("images/Chating-logo-by-meisuseno-580x446-removebg-preview.png")),
*/

        //google login button
        Positioned(
            bottom: mq.height * .15,
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .06,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 220, 187),
                    shape: const StadiumBorder(),
                    elevation: 1),
                onPressed: () {
                  logincontroller.google_signin();
                  //  logincontroller.google_signOut();
                },
                //google icon
                icon: Image.asset('assets/green.PNG', height: mq.height * .03),

                //login with google label
                label: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(text: 'Login with '),
                        TextSpan(
                            text: 'Googgle',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ]),
                ))),
      ]),
    );
  }
}
