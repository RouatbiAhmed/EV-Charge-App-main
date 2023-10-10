
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoController extends GetxController {
  var image = Rx<File?>(null);
  var base64Image = RxString('');

  void pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      image.value = File(pickedImage.path);

      // Convertir l'image en base64
      final bytes = await pickedImage.readAsBytes();
      final base64 = base64Encode(bytes);
      base64Image.value = base64;
    } else {
      print('Aucune image sélectionnée.');
    }
  }
}