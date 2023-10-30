
import 'dart:convert';
import 'dart:io';
import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/models/poi/poi.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

  final PoiDetailsController poiController = Get.find();
  final Poi? poi = poiController.poi.value;
  
class PhotoController extends GetxController {

  var image = Rx<File?>(null);
  var base64Image = RxString('');


   bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    update(); 
  }
   
  void pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      image.value = File(pickedImage.path);

      // Convert image to base64
      final bytes = await pickedImage.readAsBytes();
      final base64 = base64Encode(bytes);
      base64Image.value = base64;
    } else {
      print('Aucune image sélectionnée.');
    }
  }
}