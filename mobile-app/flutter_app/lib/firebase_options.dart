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
    apiKey: 'AIzaSyBp9ITvxYNImvpK5E_dKs2aSkpJzyBtbcE',
    appId: '1:799351242523:web:67ac4948fbef646c05ddbe',
    messagingSenderId: '799351242523',
    projectId: 'sims-82d0a',
    authDomain: 'sims-82d0a.firebaseapp.com',
    storageBucket: 'sims-82d0a.firebasestorage.app',
    measurementId: 'G-25SSL9LDDM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxcqxRILCCPJSaqEQoo-O2SbzXZ4Pw0YU',
    appId: '1:799351242523:android:971cc3cbcefde18f05ddbe',
    messagingSenderId: '799351242523',
    projectId: 'sims-82d0a',
    storageBucket: 'sims-82d0a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDC-0PNwBHLCQYfyAaYL-rdXQNX7OfpgaQ',
    appId: '1:799351242523:ios:b43cbd97b22f85e305ddbe',
    messagingSenderId: '799351242523',
    projectId: 'sims-82d0a',
    storageBucket: 'sims-82d0a.firebasestorage.app',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDC-0PNwBHLCQYfyAaYL-rdXQNX7OfpgaQ',
    appId: '1:799351242523:ios:b43cbd97b22f85e305ddbe',
    messagingSenderId: '799351242523',
    projectId: 'sims-82d0a',
    storageBucket: 'sims-82d0a.firebasestorage.app',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBp9ITvxYNImvpK5E_dKs2aSkpJzyBtbcE',
    appId: '1:799351242523:web:810d9b28ba8c6d9c05ddbe',
    messagingSenderId: '799351242523',
    projectId: 'sims-82d0a',
    authDomain: 'sims-82d0a.firebaseapp.com',
    storageBucket: 'sims-82d0a.firebasestorage.app',
    measurementId: 'G-1NE48VFJZE',
  );
}
