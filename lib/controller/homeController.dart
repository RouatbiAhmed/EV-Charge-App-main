import 'package:evchstation/widgets/markerpopup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.dialog(const Popup()); 
    });
  }
  

var markers = <Marker>[].obs;

  void addMarker(Marker marker) {
    markers.add(marker);
  }




}
