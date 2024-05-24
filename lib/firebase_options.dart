// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCU6vcD7PbpNHilIKXqs4vGqGrBbqJ_Oro',
    appId: '1:730462305365:web:76574a0af2062c8e9728dc',
    messagingSenderId: '730462305365',
    projectId: 'todo-app-71654',
    authDomain: 'todo-app-71654.firebaseapp.com',
    storageBucket: 'todo-app-71654.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByjd2G-jxDe980HcFebF-PRAQgibb-LX8',
    appId: '1:730462305365:android:f4938278f6c3fd359728dc',
    messagingSenderId: '730462305365',
    projectId: 'todo-app-71654',
    storageBucket: 'todo-app-71654.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZXTnsSu2fzwYyjJZj3BOyc1H4zscXx_M',
    appId: '1:730462305365:ios:ef18bf0992d173049728dc',
    messagingSenderId: '730462305365',
    projectId: 'todo-app-71654',
    storageBucket: 'todo-app-71654.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZXTnsSu2fzwYyjJZj3BOyc1H4zscXx_M',
    appId: '1:730462305365:ios:ef18bf0992d173049728dc',
    messagingSenderId: '730462305365',
    projectId: 'todo-app-71654',
    storageBucket: 'todo-app-71654.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCU6vcD7PbpNHilIKXqs4vGqGrBbqJ_Oro',
    appId: '1:730462305365:web:221ac15873992cf69728dc',
    messagingSenderId: '730462305365',
    projectId: 'todo-app-71654',
    authDomain: 'todo-app-71654.firebaseapp.com',
    storageBucket: 'todo-app-71654.appspot.com',
  );
}
