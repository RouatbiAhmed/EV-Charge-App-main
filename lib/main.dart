//jai enleve operatorinfo and websiteurl and opinfo
//Poi dertails ligne 80 il manque operator name
//jai enlkeve current type depuis tous les fichier
//probleme toogle 307 titile
//278613 scroll
//278672 image and 278658 277877

import 'dart:convert';

import 'package:evchstation/home_screen.dart';
import 'package:evchstation/screens/auth/login_screen.dart';
import 'package:evchstation/screens/design.dart';
import 'package:evchstation/screens/onboarding/onbording.dart';
import 'package:evchstation/screens/splashscreen/splash_screen.dart';
import 'package:evchstation/screens/toggle/addcomment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'firebase_options.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:flutter_offline/flutter_offline.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


late Size mq;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        //title: 'We Chat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 19),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        )),
        home:
            //OnBoarding()
            // LoginScreen()
           // SplashScreen()
           // Design()
            HomeScreen()
           //DemoPage()
           // AddComment()
        );
  }
}

class DemoPage extends StatelessWidget {
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
                      ? const Color(0xFF00EE44)
                      : const Color(0xFFEE4400),
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
                            Lottie.asset("assets/networkerror.json",height: 200, fit: BoxFit.cover, repeat: true),
                            Text("Check yout network connection",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}










/*


void postData() async {
  final url = 'https://api.openchargemap.io/v3/comment?key=5b031cec-5fa8-4db3-991e-8279fa849a16';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiI0NTg2MyIsIm5vbmNlIjoiMDkzNTM2ZDYtN2YzMC00NjE1LTgwNGItNGIyZTM5NmZhNjg5IiwibmJmIjoxNjk2NzcwMTg5LCJleHAiOjE2OTk0NDg1ODksImlzcyI6Ik9wZW4gQ2hhcmdlIE1hcCIsImF1ZCI6ImFwaS5vcGVuY2hhcmdlbWFwLmlvIn0.fHwaAevP-LPlewp_-FkT8ldB4oC3QVEaYNxDGQEy7h8'
  };

  final Map<String, dynamic> body = {
    'chargePointID': 189069,
    'commentTypeID': 10,
    'userName': 'Ahmed',
    'comment': 'TEST9',
    'rating': 3.4,
    'relatedURL': 'string',
    'checkinStatusTypeID': 22
  };




  try {
    final response = await http.post(Uri.parse(url),
        headers: headers, body: json.encode(body));
    final Map<String, dynamic> data = json.decode(response.body);
    print(data);
  } catch (error) {
    print(error);
  }
}

void main() {
  postData();
}
*/









