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
            Lottie.asset("assets/plugandcharge.json",
                height: 200, fit: BoxFit.cover, repeat: true),
            const Text("Plug and Charge",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text(
                'Seamlessly plug in and charge your electric vehicle. Enjoy hassle-free charging experiences on the go',
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
