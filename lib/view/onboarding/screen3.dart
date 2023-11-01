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
            //SizedBox(height:screenHeight*0.11),
            Lottie.asset("assets/animation_lndgrenb.json",
                height:screenHeight*0.27, fit: BoxFit.cover, repeat: true),
            SizedBox(height: screenHeight*0.01,),
            const Text("Find nearby charging station",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
             Padding(
              padding: EdgeInsets.only(top:screenHeight*0.03),
              child:const Text(
                'Locate nearby charging stations effortlessly. Stay connected with convenient electric vehicle charging',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
