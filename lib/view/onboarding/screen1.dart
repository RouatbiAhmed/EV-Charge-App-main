
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [     
            Lottie.asset("assets/getdirection.json",height: screenHeight*0.27, fit: BoxFit.cover, repeat: true),
                SizedBox(height: screenHeight*0.01,),
                const Text("Get Direction",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
                      Padding(
                  padding:  EdgeInsets.only(top:screenHeight*0.03),
                  child: const Text('Our intuitive interface guides you effortlessly, ensuring you never lose your way.',
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
