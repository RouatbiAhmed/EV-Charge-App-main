import 'package:evchstation/models/poi/comment/usercomment.dart';
import 'package:evchstation/models/poi/connections/connection.dart';
import 'package:evchstation/models/poi/country.dart';
import 'package:evchstation/models/poi/poi.dart';
import 'package:evchstation/models/poi/statustype.dart';
import 'package:get/get.dart';

import '../models/ahmed/usage_type.dart';

class PoiDetailsController extends GetxController {
  RxBool isExpanded = false.obs;
  RxBool light1 = true.obs;

  void toggleExpanded() {
    isExpanded.toggle();
  }
  //------------------------------------------
}


