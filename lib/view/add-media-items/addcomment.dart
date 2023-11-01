import 'package:evchstation/api/addcomment.dart';
import 'package:evchstation/controller/add-comment-controller.dart';
import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/models/poi/poi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AddComment extends StatelessWidget {
  final TextEditingController commentTextController = TextEditingController();
  final PoiDetailsController poiController = Get.find();
  final CommentController commentController = Get.put(CommentController());

  AddComment({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Comment'),
        centerTitle: true,
        elevation: 0,
        backgroundColor:const Color(0xFF28AAB1), 
      ),
      body:GetBuilder<CommentController>( 
              init: CommentController(),
               builder: (value) => value.isLoading?Stack(
                children: [
                  AddCommentScreen(),
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
            : AddCommentScreen())
    );
  }
}


class AddCommentScreen extends StatelessWidget {
  final PoiDetailsController poiController = Get.find();
  final CommentController commentController = Get.put(CommentController());
  final TextEditingController commentTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final Poi? poi = poiController.poi.value;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
              top: screenHeight * 0.1),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: commentTextController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return 'Please enter a valid comment';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Your Comment',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: screenHeight * 0.08),
                Row(
                  children: [
                    const Text("Did you charge Succesfuly: "),
                    Switch(
                      activeColor: Colors.green,
                      inactiveTrackColor: Colors.red,
                      value: poiController.light1.value,
                      onChanged: (bool value) {
                        poiController.light1.value = value;
                        commentController.chargestatus.value = value;
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.08),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding:  EdgeInsets.symmetric(horizontal: screenWidth*0.01),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    commentController.rate.value = rating;
                  },
                ),
                SizedBox(height: screenHeight*0.1),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      try {
                        postData(
                          ID: poi!.id,
                          comment: commentTextController.text,
                          rate: commentController.rate.value,
                          status:commentController.chargestatus.value ? 10 : 22,
                        );
                      } catch (error) {
                        print(error);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF28AAB1),
                    elevation: 5, 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), 
                  ),
                  child:const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
