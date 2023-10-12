import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Plug and Charge",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            Lottie.asset("assets/plugandcharge.json",height: 200, fit: BoxFit.cover, repeat: true)
          ],
        ),
      ),
    );
  }
}
