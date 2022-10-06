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
    apiKey: 'AIzaSyD0ahCDAVULxiEn_R5W42Yyy9xCjl9WSzQ',
    appId: '1:465027589183:web:8ccc7b980b84765263848a',
    messagingSenderId: '465027589183',
    projectId: 'meshr-app',
    authDomain: 'meshr-app.firebaseapp.com',
    storageBucket: 'meshr-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCu4-_ZS8Kqcna03sORxBcXvWNZhi_IZzY',
    appId: '1:465027589183:android:31f05f976002fa5063848a',
    messagingSenderId: '465027589183',
    projectId: 'meshr-app',
    storageBucket: 'meshr-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASt1cwj17z9BGtauYrewnyemvnsoyORdc',
    appId: '1:465027589183:ios:24145270c9fc9fdc63848a',
    messagingSenderId: '465027589183',
    projectId: 'meshr-app',
    storageBucket: 'meshr-app.appspot.com',
    iosClientId: '465027589183-k62ug0bukg9c9isamnspmq1lfn00oq2u.apps.googleusercontent.com',
    iosBundleId: 'com.example.meshrApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASt1cwj17z9BGtauYrewnyemvnsoyORdc',
    appId: '1:465027589183:ios:24145270c9fc9fdc63848a',
    messagingSenderId: '465027589183',
    projectId: 'meshr-app',
    storageBucket: 'meshr-app.appspot.com',
    iosClientId: '465027589183-k62ug0bukg9c9isamnspmq1lfn00oq2u.apps.googleusercontent.com',
    iosBundleId: 'com.example.meshrApp',
  );
}
