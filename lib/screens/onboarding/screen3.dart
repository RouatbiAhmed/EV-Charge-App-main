import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Find nearby charging station",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            Lottie.asset("assets/animation_lndgrenb.json",
                height: 200, fit: BoxFit.cover, repeat: true)
          ],
        ),
      ),
    );
  }
}
