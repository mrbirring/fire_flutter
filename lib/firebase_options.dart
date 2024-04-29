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
    apiKey: 'AIzaSyBR6JfXG02iaW5F-sxUczbFPS0GHxR-AV4',
    appId: '1:690359803219:web:0a5303d095798a5c2b15a6',
    messagingSenderId: '690359803219',
    projectId: 'firstfire-cfc45',
    authDomain: 'firstfire-cfc45.firebaseapp.com',
    storageBucket: 'firstfire-cfc45.appspot.com',
    measurementId: 'G-7QNL4XXZLZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUgTjBXD_1jIm17oDJ7PcNv-DAKqRxzW8',
    appId: '1:690359803219:android:59146f545cb109982b15a6',
    messagingSenderId: '690359803219',
    projectId: 'firstfire-cfc45',
    storageBucket: 'firstfire-cfc45.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNoCunyeiZ3uvis_kACTtpvOyEjGgLMO4',
    appId: '1:690359803219:ios:ea2c56d4538f2f2a2b15a6',
    messagingSenderId: '690359803219',
    projectId: 'firstfire-cfc45',
    storageBucket: 'firstfire-cfc45.appspot.com',
    iosBundleId: 'com.example.fireFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNoCunyeiZ3uvis_kACTtpvOyEjGgLMO4',
    appId: '1:690359803219:ios:ddaf715ae39ae7692b15a6',
    messagingSenderId: '690359803219',
    projectId: 'firstfire-cfc45',
    storageBucket: 'firstfire-cfc45.appspot.com',
    iosBundleId: 'com.example.fireFlutter.RunnerTests',
  );
}
