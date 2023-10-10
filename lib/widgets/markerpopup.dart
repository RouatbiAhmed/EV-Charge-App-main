import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MarkerPopup extends StatelessWidget {
  const MarkerPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Popup Title'),
      content: Container(
        height: 200,
        child: Column(
          children: [
            Row(
              children: [
                Text('Level'),
                Lottie.asset("assets/redmarker.json",
                    height: 50, width: 50, repeat: true),
              ],
            ),
            Row(
              children: [
                Text('Level'),
                Lottie.asset("assets/greenmarker.json",
                    height: 50, width: 50, repeat: true),
              ],
            ),
            Row(
              children: [
                Text('Level'),
                Lottie.asset("assets/bluemarker.json",
                    height: 50, width: 50, repeat: true),
              ],
            ),
            Row(
              children: [
                Text('Level'),
                Lottie.asset("assets/orangemarker.json",
                    height: 50, width: 50, repeat: true),
              ],
            ),
          ],
        ),
      ),
      //icon: Lottie.asset("assets/getdirection.json",height: 20,width:20,repeat: true),

      actions: <Widget>[
        TextButton(
          child: Text('Fermer'),
          onPressed: () {
            Get.back(); // Ferme le popup
          },
        ),
      ],
    );
  }
}
