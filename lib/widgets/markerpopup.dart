import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Popup extends StatelessWidget {
  const Popup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:const Center(child: Text('Note :')),
      content: Container(
        height: 200,
        child: Column(
          children: [
            Row(
              children: [
                const Text('broken-down '),
                Lottie.asset("assets/redmarker.json",
                    height: 50, width: 50, repeat: true),
              ],
            ),
            Row(
              children: [
                const Text('Station Level 3'),
                Lottie.asset("assets/greenmarker.json",
                    height: 50, width: 50, repeat: true),
              ],
            ),
            Row(
              children: [
                const Text('Station Level 2'),
                Lottie.asset("assets/bluemarker.json",
                    height: 50, width: 50, repeat: true),
              ],
            ),
            Row(
              children: [
                const Text('Station Level 1'),
                Lottie.asset("assets/orangemarker.json",
                    height: 50, width: 50, repeat: true),
              ],
            ),
          ],
        ),
      ),

      actions: <Widget>[
        TextButton(
          child:const Text('Close'),
          onPressed: () {
            Get.back(); //close popup
          },
        ),
      ],
    );
  }
}
