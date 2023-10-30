import 'package:evchstation/controller/Auth/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        height: screenHeight*0.4,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            children: [
              Text(
                authController.username!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
               SizedBox(
              height: screenHeight * 0.05,
            ),
            Text(
              "${authController.useremail}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
               SizedBox(
              height: screenHeight * 0.05,
            ),
              Text(
                "${authController.userphonenumber ?? "Unknown"}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: MaterialButton(
                  minWidth: screenWidth*0.6,
                  onPressed: () {
                    authController.google_signOut();
                    
                    },
                  color:const Color(0xFF28AAB1),
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
              
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(authController.imageurl)             
                ),         
          ],
        ),
      ),
    );
  }
}
