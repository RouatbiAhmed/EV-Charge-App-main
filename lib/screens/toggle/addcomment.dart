import 'package:evchstation/api/addcomment.dart';
import 'package:evchstation/controller/arguments.dart';
import 'package:evchstation/controller/commentcontroller.dart';
import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class AddComment extends StatelessWidget {
  final PoiDetailsController controller = Get.put(PoiDetailsController());
  final CommentController commentController = Get.put(CommentController());
  final TextEditingController commentTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Arguments args = Get.arguments;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Comment'),
        centerTitle: true,
        elevation: 0,
        backgroundColor:Color(0xFF28AAB1), // Couleur du thème de l'application
      ),
      body: Obx(
        () => commentController.isLoading.value
            ? Center(
                child: Lottie.asset(
                  "assets/done.json",
                  height: 200,
                  fit: BoxFit.cover,
                  repeat: true,
                ),
              )
            : SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(left:16.0,right: 16,top: 50),
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
             
                        SizedBox(height:66),
                        Row(
                          children: [
                            Text("Did you charge Succesfuly: "),
                            Switch(
                              activeColor: Colors.green,
                              inactiveTrackColor: Colors.red,
                              value: controller.light1.value,
                              onChanged: (bool value) {
                                controller.light1.value = value;
                                commentController.chargestatus.value = value;
                              },
                            ),
                          ],
                        ),
            
                           const   SizedBox(height: 66),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            commentController.rate.value = rating;
                          },
                        ),
                        SizedBox(height: 52),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              try {
                                postData(
                                  ID: args.id,
                                  comment: commentTextController.text,
                                  rate: commentController.rate.value,
                                  status: commentController.chargestatus.value ? 10 : 22,
                                );
                              } catch (error) {
                                print(error);
                              }
                            }
                          },
                          child: Text('Submit'),
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
class AddComment extends StatelessWidget {
  final Controller = Get.put(PoiDetailsController());
  final commentcontroller = Get.put(CommentController());
  final TextEditingController commenttext = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //bool light1 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    final Arguments arg = Get.arguments;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Obx(() => commentcontroller.isLoading.value == true
        ? Scaffold(
          body: Center(
              child: Lottie.asset(
                "assets/done.json",
                height: 200,
                fit: BoxFit.cover,
                repeat: true,
              ),
            ),
        )
        : Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Scaffold(
              body: Container(
                height: screenHeight,
                width: screenWidth,
                child: Stack(
                  children: [
                    Positioned(
                        top: screenHeight * 0.1,
                        left: screenWidth * 0.2,
                        child: Container(
                          height: 300,
                          width: 200,
                          child: TextFormField(
                            controller: commenttext,
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
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.blue),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // Set border for focused state
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        )),
                    // Obx(() =>
                    Positioned(
                      top: screenHeight * 0.8,
                      left: screenWidth * 0.1,
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          commentcontroller.rate.value = rating;
                          print(rating);
                        },
                      ),
                    ),
                     Positioned(
                        top: screenHeight * 0.6,
                        left: screenWidth * 0.1,
                        child: Row(
                          children: [
                            Text("Did you charge successfuly"),
                            Switch(
                              activeColor: Colors.green,
                              inactiveTrackColor: Colors.red,
                              thumbIcon: thumbIcon,
                              value: Controller.light1.value,
                              onChanged: (bool value) {
                                Controller.light1.value = value;
                                commentcontroller.chargestatus.value = value;
                                print(value);
                              },
                            ),
                          ],
                        )),
                       
                    Positioned(
                        top: screenHeight * 0.9,
                        left: screenWidth * 0.7,
                        child: MaterialButton(
                            child: Text(
                              "Submit",
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              //commentcontroller.text.value=commenttext.text;
                              try {
                                postData(
                                    ID: arg.id,
                                    comment: commenttext.text,
                                    rate: commentcontroller.rate.value,
                                    status: commentcontroller.chargestatus.value
                                        ? 10
                                        : 22);
                              } catch (error) {
                                print(error);
                              }
                            })),
                  ],
                ),
              ),
            ),
          ));
  }
}
*/

//--------YES/NO-----------
/*  Positioned(
              top: screenHeight * 0.6,
              left: screenWidth * 0.1,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // title: Text("Confirmation"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RadioListTile(
                              title: Text("Yes"),
                              value: true,
                              groupValue: Controller.isConfirmed,
                              onChanged: (value) {
                                Controller.isConfirmed.value = true!;
                                print(
                                    "yyyyyyyyyyy---------${Controller.isConfirmed.value}----yyyyyyy");

                                Navigator.of(context).pop();
                              },
                            ),
                            RadioListTile(
                              title: Text("No"),
                              value: false,
                              groupValue: Controller.isConfirmed.value,
                              onChanged: (value) {
                                Controller.isConfirmed.value = false;
                                print(
                                    "nnnnnnnn---${Controller.isConfirmed.value}----nnnnnnnnn");

                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("rate the station"),
              ),
            )*/
//)
