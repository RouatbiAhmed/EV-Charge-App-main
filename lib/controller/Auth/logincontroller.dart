import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evchstation/home_screen.dart';
import 'package:evchstation/screens/auth/login_screen.dart';
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

//__________________ Email & Password auth ________________

  void createUser({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) async {
    String documentId = '$firstname$lastname';

    Map<String, String> userdata = {
      "email": email,
      "password": password,
      "firstname": firstname,
      "lastname": lastname
    };

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      FirebaseFirestore.instance
          .collection(
              'users') // Replace 'users' with your Firestore collection name
          .doc(_firebaseUser.value!.uid)
          .set(userdata)
          .then((value) => Get.offAll(() => HomeScreen()));
    }).catchError((onError) =>
            Get.snackbar("Error while creating account", onError.message));
  }

  void login(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              Get.offAll(
                () => HomeScreen(),
              ),
              isLoading.value = false
            })
        .catchError(
            (onError) => Get.snackbar("Error while sign in ", onError.message));
  }

  void signout() async {
    await _auth.signOut().then(
        (value) => {Get.offAll(() => LoginScreen()), isLoading.value = false});
  }

  void sendpasswordresetemail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(() => LoginScreen());
      Get.snackbar("Password Reset email link is been sent", "Success");
      // ignore: invalid_return_type_for_catch_error
    }).catchError(
        (onError) => Get.snackbar("Error In Email Reset", onError.message));
  }

  //_________________Google Auth______________

  void google_signin() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      // isLoading = false.obs;
      return;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    Map<String, String> userdata = {
      "email": "${useremail}",
    };

    final User user = userCredential.user!;

    reference.doc(useremail).set(userdata);
    print("-----------YYYYYYYYYYYYYYYYYY------------");
    Get.offAll(() => HomeScreen());
  }

  void google_signOut() async {
    await googleSignIn
        .signOut()
        .then((value) => Get.offAll(() => LoginScreen()));
  }
  //--------------User info---------------------

  // get current user email
  String? get useremail => _firebaseUser.value?.email;
  String? get username => _firebaseUser.value?.displayName;

  GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: ['email']); //initialization with scope as Email

  CollectionReference reference =
      FirebaseFirestore.instance.collection("users");
  String get imageurl => _firebaseUser.value!.photoURL!;

  //--------------User image---------------------
  getProfileImage() {
    if (_firebaseUser.value?.photoURL != null) {
      return Image.network(_firebaseUser.value!.photoURL!);
    } else
      return Icon(Icons.account_circle);
  }

//------------Name and lastname-------------

  String? getname() {
    if (_firebaseUser.value?.photoURL != null) {
      return username;
    } else {
      String? extractedValue = extraireValeur(useremail, "@");
      return extractedValue ?? "";
    }
  }

  String extraireValeur(String? chaine, String caractere) {
    int index = chaine?.indexOf(caractere) ?? -1;

    if (index != -1) {
      return chaine?.substring(0, index) ?? "";
    } else {
      return chaine ?? "";
    }
  }
}
