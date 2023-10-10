import 'package:evchstation/main.dart';
import 'package:evchstation/screens/toggle/toggle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Design extends StatelessWidget {
  const Design({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: screenHeight,
            child: Stack(
              children: [
                Positioned(
                    top: screenHeight * 0,
                    left: screenWidth * 0,
                    child: Container(
                      height: screenHeight * 0.2,
                      width: screenWidth,
                      color: Color.fromARGB(255, 173, 22, 128),
                      child: Text("DDDD"),
                    )),
                Positioned(
                    top: screenHeight * 0.2,
                    left: screenWidth * 0.04,
                    child: ToggleSwitchExample())
              ],
            )),
      ),
    );
  }
}
