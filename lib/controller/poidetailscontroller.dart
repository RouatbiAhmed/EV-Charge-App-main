import 'package:evchstation/models/poi/poi.dart';
import 'package:get/get.dart';

class PoiDetailsController extends GetxController {
  RxBool isExpanded = false.obs;
  RxBool light1 = true.obs;

  void toggleExpanded() {
    isExpanded.toggle();
  }

  Rx<Poi?> poi = Rx<Poi?>(null);

  // Update the controller
  void updatePoi(Poi newPoi) {
    poi.value = newPoi;
  }
}
