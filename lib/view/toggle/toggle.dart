
import 'package:evchstation/view/toggle/details.dart';
import 'package:evchstation/view/toggle/comments.dart';
import 'package:evchstation/view/toggle/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ToggleSwitchExample extends StatelessWidget {
  final RxInt currentIndex = 0.obs;

   ToggleSwitchExample({super.key});

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Obx(
          () => CupertinoSlidingSegmentedControl<int>(
            groupValue: currentIndex.value,
            onValueChanged: (value) {
              currentIndex.value = value!;
            },
            children: const {
              0: Text('Details'),
              1: Text('Comments'),
              2: Text('Photos'),
            },
          ),
        ),
        Obx(
          () => IndexedStack(
            index: currentIndex.value,
            children: [
              const Details(),
              const Comments(),
              Photos(),
            ],
          ),
        ),
      ],
    );
  }
}


