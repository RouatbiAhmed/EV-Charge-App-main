import 'package:evchstation/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:screenHeight*0.11),
            Lottie.asset("assets/animation_lndgrenb.json",
                height: 200, fit: BoxFit.cover, repeat: true),
            const Text("Find nearby charging station",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text(
                'Locate nearby charging stations effortlessly. Stay connected with convenient electric vehicle charging',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: screenHeight*0.04,),
            TextButton(
                onPressed: () {Get.offAll(LoginScreen());},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return const Color(0xFF28AAB1);
                    },
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), 
                    ),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
