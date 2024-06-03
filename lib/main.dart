

//1-media querry-------------
//2-google auth conroller --------
//3-splash and on boarding----------
//4-comment the code
//5-API model review-----------
//6-to json fix------------
//7-user profile and signup buttton ---------
//8-rester connecter--------------
//9-pagination--------------
//10-Text style
//11-Live stream location-----------
//12-Binding et reglage getfind
//13-Getbuilder-----------
//14-network connection -----------

import 'package:evchstation/controller/Auth/authcontroller.dart';
import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/widgets/networkcheck.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 19),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        )),
        home:const NetworkCheck(),
       
      initialBinding: BindingsBuilder(() {
      Get.put(AuthController());
      Get.put(PoiDetailsController());

    }),
        );
        
        
  }
}

