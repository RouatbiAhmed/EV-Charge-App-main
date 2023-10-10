//---image picker

import 'dart:convert';
import 'dart:io';

import 'package:evchstation/api/addphoto.dart';
import 'package:evchstation/controller/photocontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';




class AddPhoto extends StatelessWidget {
  final PhotoController photocontroller = Get.put(PhotoController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Picker avec GetX'),
        ),
        body: Center(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {postData(imagebase64:photocontroller.base64Image.value);}),
                ElevatedButton(
                  onPressed: () =>
                      photocontroller.pickImage(ImageSource.camera),
                  child: Text('Prendre une photo'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      photocontroller.pickImage(ImageSource.gallery),
                  child: Text('Choisir depuis la galerie'),
                ),
                SizedBox(height: 20),
                if (photocontroller.image.value != null)
                  Image.file(
                    photocontroller.image.value!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                SizedBox(height: 20),
                Text(
                  'Code Base64 de l\'image :',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  photocontroller.base64Image.value,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
