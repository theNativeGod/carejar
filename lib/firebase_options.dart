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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAH1iDrJsG7rYXsLbKSA47lVE49FXWzj0I',
    appId: '1:879960378591:web:dbd01b7bab2c76a6856d6a',
    messagingSenderId: '879960378591',
    projectId: 'carejar',
    authDomain: 'carejar.firebaseapp.com',
    databaseURL: 'https://carejar-default-rtdb.firebaseio.com',
    storageBucket: 'carejar.appspot.com',
    measurementId: 'G-2DK7FMQVQ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCkL1lwO4CrwdPxaXXumHn5LwU3TZ_Ugc',
    appId: '1:879960378591:android:a2f0d5264d480f4c856d6a',
    messagingSenderId: '879960378591',
    projectId: 'carejar',
    databaseURL: 'https://carejar-default-rtdb.firebaseio.com',
    storageBucket: 'carejar.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4bglfwZS8hbQ7Pclmu-kCSTxXxzZZlQU',
    appId: '1:879960378591:ios:13207daad0916e76856d6a',
    messagingSenderId: '879960378591',
    projectId: 'carejar',
    databaseURL: 'https://carejar-default-rtdb.firebaseio.com',
    storageBucket: 'carejar.appspot.com',
    iosBundleId: 'com.example.carejar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4bglfwZS8hbQ7Pclmu-kCSTxXxzZZlQU',
    appId: '1:879960378591:ios:31f6f38599ed3da2856d6a',
    messagingSenderId: '879960378591',
    projectId: 'carejar',
    databaseURL: 'https://carejar-default-rtdb.firebaseio.com',
    storageBucket: 'carejar.appspot.com',
    iosBundleId: 'com.example.carejar.RunnerTests',
  );
}
