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
    apiKey: 'AIzaSyBxD-nE8BZM2GVEom4kIqasj8bnf29x8wU',
    appId: '1:268072839250:web:047f05112cfb432f17578b',
    messagingSenderId: '268072839250',
    projectId: 'notekeeper-app-c921e',
    authDomain: 'notekeeper-app-c921e.firebaseapp.com',
    storageBucket: 'notekeeper-app-c921e.appspot.com',
    measurementId: 'G-W5KZ7YMYDR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEOFBoYH_SHl7pgtcaaCTjAAoqEwdL4Ag',
    appId: '1:268072839250:android:6460bcf88768bb7517578b',
    messagingSenderId: '268072839250',
    projectId: 'notekeeper-app-c921e',
    storageBucket: 'notekeeper-app-c921e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCw1E2abVBhsPrEUABZE-GncDeFSGVtkgs',
    appId: '1:268072839250:ios:40d9971a482b39a017578b',
    messagingSenderId: '268072839250',
    projectId: 'notekeeper-app-c921e',
    storageBucket: 'notekeeper-app-c921e.appspot.com',
    iosClientId: '268072839250-ttmfru10q349mb1qnnclmhsv1e0h1nch.apps.googleusercontent.com',
    iosBundleId: 'com.example.notekeeperApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCw1E2abVBhsPrEUABZE-GncDeFSGVtkgs',
    appId: '1:268072839250:ios:40d9971a482b39a017578b',
    messagingSenderId: '268072839250',
    projectId: 'notekeeper-app-c921e',
    storageBucket: 'notekeeper-app-c921e.appspot.com',
    iosClientId: '268072839250-ttmfru10q349mb1qnnclmhsv1e0h1nch.apps.googleusercontent.com',
    iosBundleId: 'com.example.notekeeperApp',
  );
}
