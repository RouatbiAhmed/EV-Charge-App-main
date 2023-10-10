/*import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Text("Get Direction",
           style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
                ),              
          Lottie.asset("assets/getdirection.json",height: 150 ,fit: BoxFit.cover,repeat: true)
        ],
      ),),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Get Direction",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            Lottie.asset("assets/getdirection.json",
                height: 200, fit: BoxFit.cover, repeat: true)
          ],
        ),
      ),
    );
  }
}
