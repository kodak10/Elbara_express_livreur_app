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
    apiKey: 'AIzaSyDecX_K4JptPeaXO5-48iTvSjOZ5BaxQM4',
    appId: '1:998391121356:web:c559a166f0320ce9ee8969',
    messagingSenderId: '998391121356',
    projectId: 'elbaraexpress-9b834',
    authDomain: 'elbaraexpress-9b834.firebaseapp.com',
    storageBucket: 'elbaraexpress-9b834.appspot.com',
    measurementId: 'G-MD25PC64H9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0gDkkr1joWeyRz-T7Wx0YBSUiOtt-DjY',
    appId: '1:998391121356:android:fe31b5939f7858f3ee8969',
    messagingSenderId: '998391121356',
    projectId: 'elbaraexpress-9b834',
    storageBucket: 'elbaraexpress-9b834.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASAUWw02rQCkumTUzJTE7ZBqbBh_OfL9E',
    appId: '1:998391121356:ios:24142235b243e959ee8969',
    messagingSenderId: '998391121356',
    projectId: 'elbaraexpress-9b834',
    storageBucket: 'elbaraexpress-9b834.appspot.com',
    iosBundleId: 'com.example.elbaraExpressDeliveryMan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASAUWw02rQCkumTUzJTE7ZBqbBh_OfL9E',
    appId: '1:998391121356:ios:67d6104fba4d615eee8969',
    messagingSenderId: '998391121356',
    projectId: 'elbaraexpress-9b834',
    storageBucket: 'elbaraexpress-9b834.appspot.com',
    iosBundleId: 'com.example.elbaraExpressDeliveryMan.RunnerTests',
  );
}
