
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
            Lottie.asset("assets/getdirection.json",height: 200, fit: BoxFit.cover, repeat: true),
                const Text("Get Direction",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
                    const  Padding(
                  padding:  EdgeInsets.only(top:18.0),
                  child: Text('Our intuitive interface guides you effortlessly, ensuring you never lose your way.',
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
