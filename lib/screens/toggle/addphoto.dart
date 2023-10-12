//---image picker

import 'dart:convert';
import 'dart:io';

import 'package:evchstation/api/addphoto.dart';
import 'package:evchstation/controller/arguments.dart';
import 'package:evchstation/controller/photocontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:evchstation/controller/photocontroller.dart';
import 'package:evchstation/controller/arguments.dart';

class AddPhoto extends StatelessWidget {
  final PhotoController photoController = Get.put(PhotoController());
  final TextEditingController descriptionTextController = TextEditingController();
  final Arguments args = Get.arguments;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une Photo'),
        centerTitle: true,
        elevation: 0,
        backgroundColor:Color(0xFF28AAB1), // Couleur du thème de l'application
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Center(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: descriptionTextController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'Veuillez entrer une description valide';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    maxLines: 4,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        photoController.pickImage(ImageSource.camera);
                      }
                    },
                    child: Text('Prendre une photo'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        photoController.pickImage(ImageSource.gallery);
                      }
                    },
                    child: Text('Choisir depuis la galerie'),
                  ),
                  SizedBox(height: 20),
                  if (photoController.image.value != null)
                    Image.file(
                      photoController.image.value!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        postData(
                          imagebase64: photoController.base64Image.value,
                          ID: args.id,
                          desciptiontext: descriptionTextController.text,
                        );
                      }
                    },
                    child: Text('Soumettre'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF28AAB1), // Couleur du bouton
                      elevation: 5, // Ombre du bouton
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), // Bordure du bouton
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




























/*
class AddPhoto extends StatelessWidget {
  final PhotoController photocontroller = Get.put(PhotoController());
    final TextEditingController descriptiontext = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final Arguments arg = Get.arguments;
        
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Picker avec GetX'),
        ),
        body: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
           key: _formKey,
          child: Center(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Positioned(
                    top: screenHeight * 0.1,
                    left: screenWidth * 0.2,
                    child: Container(
                      height: 300,
                      width: 200,
                      child: TextFormField(
                        controller: descriptiontext,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Please enter a valid comment';
                          }
                          return null;
                        }, // Return null if the validation succeeds,
                        decoration: InputDecoration(
                            labelText: 'What Did You Think',
                            // Set border for enabled state (default)
                            enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 3, color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // Set border for focused state
                            focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 3, color: Colors.red),
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    )),
                  MaterialButton(
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {postData(imagebase64:photocontroller.base64Image.value,
                      ID:arg.id,
                      desciptiontext: descriptiontext.text
                      );}),
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
                 /* SizedBox(height: 20),
                  Text(
                    'Code Base64 de l\'image :',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    photocontroller.base64Image.value,
                    style: TextStyle(fontSize: 14),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/