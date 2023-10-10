// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCb82UuTQ7q4lGMj08AOkT1rhEPFWXKzgA',
    appId: '1:717900232465:android:14f4ef3dbec2208ac13eb0',
    messagingSenderId: '717900232465',
    projectId: 'evchargestation-b6e1a',
    storageBucket: 'evchargestation-b6e1a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSEwUqkJyu2OsPMaaLwEQLW6ByKC64tXo',
    appId: '1:717900232465:ios:f0091de24fc00c57c13eb0',
    messagingSenderId: '717900232465',
    projectId: 'evchargestation-b6e1a',
    storageBucket: 'evchargestation-b6e1a.appspot.com',
    androidClientId:
        '717900232465-914qbgfhlr3niledo8uu6okiblj1nu32.apps.googleusercontent.com',
    iosClientId:
        '717900232465-v8kurjskid153eab524nrb62i9ms0q26.apps.googleusercontent.com',
    iosBundleId: 'com.example.evchstation',
  );
}
