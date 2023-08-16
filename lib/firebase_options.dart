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
    apiKey: 'AIzaSyB7SLMqxbHzLXPZmK2bYgVmPNwvZRz6ILw',
    appId: '1:574563442380:web:523701e671695bdcd66c69',
    messagingSenderId: '574563442380',
    projectId: 'tukuntazo-travel',
    authDomain: 'tukuntazo-travel.firebaseapp.com',
    storageBucket: 'tukuntazo-travel.appspot.com',
    measurementId: 'G-0L2126QPGB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTkOZ9Im_NpbMp3Qvl0T6tVu50Dnz5ass',
    appId: '1:574563442380:android:2615f28aad4a372cd66c69',
    messagingSenderId: '574563442380',
    projectId: 'tukuntazo-travel',
    storageBucket: 'tukuntazo-travel.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIu087ZY7O0BS6iygp7lY2-YFf7sJJaag',
    appId: '1:574563442380:ios:0b84a8a452f1b08bd66c69',
    messagingSenderId: '574563442380',
    projectId: 'tukuntazo-travel',
    storageBucket: 'tukuntazo-travel.appspot.com',
    iosClientId: '574563442380-hr7cqjqloa8185tvm7ikn5nd7l0uvbrr.apps.googleusercontent.com',
    iosBundleId: 'com.example.tukuntazoTravel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIu087ZY7O0BS6iygp7lY2-YFf7sJJaag',
    appId: '1:574563442380:ios:b6d2ef7080ea8180d66c69',
    messagingSenderId: '574563442380',
    projectId: 'tukuntazo-travel',
    storageBucket: 'tukuntazo-travel.appspot.com',
    iosClientId: '574563442380-b2hq719p9ulek2cj402a1lajo8uo8q8g.apps.googleusercontent.com',
    iosBundleId: 'com.example.tukuntazoTravel.RunnerTests',
  );
}