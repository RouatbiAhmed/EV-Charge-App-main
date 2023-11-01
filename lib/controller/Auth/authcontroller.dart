import 'package:evchstation/view/home_screen.dart';
import 'package:evchstation/view/auth/login_screen.dart';
import 'package:evchstation/view/splash-screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  RxBool ispasswordhiden = true.obs;

  RxBool ispasswordremembred = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rxn<User> _firebaseUser = Rxn<User>();

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }



  void google_signin() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return;
    }
    final GoogleSignInAuthentication googleAuth =await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final UserCredential userCredential =await _auth.signInWithCredential(credential);

   /* Map<String, String> userdata = {
      "email": "${useremail}",
    };*/

    //final User user = userCredential.user!;

   // reference.doc(useremail).set(userdata);
    Get.offAll(() => HomeScreen());
  }

  void google_signOut() async {
    await googleSignIn
        .signOut()
        .then((value) => Get.offAll(() => SplashScreen()));
  }

  // get current User info
  String? get usereimage => _firebaseUser.value?.photoURL;
  String? get useremail => _firebaseUser.value?.email;
  String? get username => _firebaseUser.value?.displayName;
  String? get userphonenumber => _firebaseUser.value?.phoneNumber;

  GoogleSignIn googleSignIn =GoogleSignIn(scopes: ['email']);

  //CollectionReference reference =FirebaseFirestore.instance.collection("users");
  String get imageurl => _firebaseUser.value!.photoURL!;




}

