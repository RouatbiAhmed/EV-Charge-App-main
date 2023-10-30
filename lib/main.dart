//jai enleve operatorinfo and websiteurl and opinfo
//Poi dertails ligne 80 il manque operator name
//jai enlkeve current type depuis tous les fichier
//probleme toogle 307 titile
//278613 scroll
//278672 image and 278658 277877
//---------
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

import 'package:evchstation/controller/Auth/issignedin.dart';
import 'package:evchstation/controller/Auth/authcontroller.dart';
import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/view/home_screen.dart';
import 'package:evchstation/view/auth/login_screen.dart';
import 'package:evchstation/view/onboarding/onbording.dart';
import 'package:evchstation/view/splash-screen/splash_screen.dart';
import 'package:evchstation/view/add-media-items/addphoto.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
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
        home:
              //AddPhoto(),
             //IsSignedIn(),
             OnBoarding(),
            // LoginScreen(),
            // SplashScreen(),
            // Design()
          // HomeScreen(),
        //DemoPage()
        // AddComment()
      initialBinding: BindingsBuilder(() {
      Get.put(AuthController());
      Get.put(PoiDetailsController());

    }),
        );
        
        
  }
}


/*class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                height: 24.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  color: connected
                      ? const Color(0xFF00EE44):const Color(0xFFEE4400),
                  child: Center(
                    child: Text("${connected ? 'ONLINE' : 'OFFLINE'}"),
                  ),
                ),
              ),
              Center(
                  child: connected
                      ? HomeScreen()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset("assets/networkerror.json",
                                height: 200, fit: BoxFit.cover, repeat: true),
                            const Text("Check yout network connection",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        )),
            ],
          );
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'There are no bottons to push :)',
            ),
            Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}*/

