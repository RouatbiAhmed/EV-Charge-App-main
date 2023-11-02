//---image picker

import 'package:evchstation/api/addphoto.dart';
import 'package:evchstation/controller/add-photo-controller.dart';
import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/models/poi/poi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title:const Text('Add Photo'),
          centerTitle: true,
          elevation: 0,
          backgroundColor:const Color(0xFF28AAB1), 
        ),
        body: GetBuilder<PhotoController>( 
              init: PhotoController(),
               builder: (value) => value.isLoading?Stack(
                children: [
                  AddPhotoScreen(),
                  Center(
                    child: Lottie.asset(
                      "assets/done.json",
                      height: 200,
                      fit: BoxFit.cover,
                      repeat: true,
                    ),
                  ),
                ],
              )
            : AddPhotoScreen())

            
            );
  }
}




class AddPhotoScreen extends StatelessWidget {
  AddPhotoScreen({super.key});

  final PhotoController photoController = Get.put(PhotoController());
  final TextEditingController descriptionTextController =TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PoiDetailsController poiController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final Poi? poi = poiController.poi.value;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(right: screenWidth*0.02, left:screenWidth*0.02, top: screenHeight*0.02),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Center(
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right:screenWidth*0.654),
                      child: Text(poi?.addressInfo?.title??"Unknown",style: const TextStyle(fontSize: 20),),
                    ),
                    SizedBox(height: screenHeight * .04),
                    const Text("You can upload a photo from your device or take a new photo",style: TextStyle(fontSize: 15),),
                    SizedBox(height: screenHeight * .05),
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
                    SizedBox(height: screenHeight * .05),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: screenWidth * .03),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:const Color(0xFF28AAB1), 
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              photoController.pickImage(ImageSource.camera);
                            }
                          },
                          child:const Text('Take new photo'),
                        ),
                        SizedBox(width: screenWidth * .03),
                          ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:const Color(0xFF28AAB1), 
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          photoController.pickImage(ImageSource.gallery);
                        }
                      },
                      child:const Text('Uplod  from your device'),
                    ),
                      ],
                    ),

                    if (photoController.image.value != null)
                      Image.file(
                        photoController.image.value!,
                        width: screenWidth * 0.6,
                        height: screenHeight * 0.4,
                        fit: BoxFit.cover,
                      ),
                    SizedBox(height: photoController.image.value != null?screenHeight * .1:screenHeight * .3),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          postData(
                            imagebase64: photoController.base64Image.value,
                            ID: poi!.id,
                            desciptiontext: descriptionTextController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF28AAB1),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child:const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
