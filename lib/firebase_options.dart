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
    apiKey: 'AIzaSyDOsFTZNh-YWjDZxrn1q0ZfdO4u4w5CCzM',
    appId: '1:17922558446:web:240d4c84fc9ab98a6026ff',
    messagingSenderId: '17922558446',
    projectId: 't000-dooo-appo',
    authDomain: 't000-dooo-appo.firebaseapp.com',
    storageBucket: 't000-dooo-appo.firebasestorage.app',
    measurementId: 'G-MTMY38M3XV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJSnfprChOFF9bdoYj5FP0Q96d-QgduTo',
    appId: '1:17922558446:android:6255bd6d25d67b266026ff',
    messagingSenderId: '17922558446',
    projectId: 't000-dooo-appo',
    storageBucket: 't000-dooo-appo.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhuTU-H2hqTR0AbivTcLD6BkK5z966Yao',
    appId: '1:17922558446:ios:a6837e4b935e197f6026ff',
    messagingSenderId: '17922558446',
    projectId: 't000-dooo-appo',
    storageBucket: 't000-dooo-appo.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhuTU-H2hqTR0AbivTcLD6BkK5z966Yao',
    appId: '1:17922558446:ios:a6837e4b935e197f6026ff',
    messagingSenderId: '17922558446',
    projectId: 't000-dooo-appo',
    storageBucket: 't000-dooo-appo.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDOsFTZNh-YWjDZxrn1q0ZfdO4u4w5CCzM',
    appId: '1:17922558446:web:997317a89eb5783b6026ff',
    messagingSenderId: '17922558446',
    projectId: 't000-dooo-appo',
    authDomain: 't000-dooo-appo.firebaseapp.com',
    storageBucket: 't000-dooo-appo.firebasestorage.app',
    measurementId: 'G-C786P6TJ25',
  );
}
