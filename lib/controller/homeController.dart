import 'package:evchstation/widgets/markerpopup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.dialog(MarkerPopup()); // Affiche le popup
    });
  }
}
