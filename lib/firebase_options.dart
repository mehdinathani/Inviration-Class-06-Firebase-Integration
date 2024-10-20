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
    apiKey: 'AIzaSyD73KsrV53Q8yo385ws4Yij5e8omviGuak',
    appId: '1:215717871275:web:bd9bedec127fd6037941ee',
    messagingSenderId: '215717871275',
    projectId: 'classsix',
    authDomain: 'classsix.firebaseapp.com',
    storageBucket: 'classsix.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnZcQDHWWze7jFgBPlUj5Ava7toLlyFTU',
    appId: '1:215717871275:android:e7c185657c2ec0767941ee',
    messagingSenderId: '215717871275',
    projectId: 'classsix',
    storageBucket: 'classsix.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB08lOBxwtBl_LLUzeEoOBm9Xd3J_qUEf0',
    appId: '1:215717871275:ios:3d6848cb76aa11d27941ee',
    messagingSenderId: '215717871275',
    projectId: 'classsix',
    storageBucket: 'classsix.appspot.com',
    iosBundleId: 'com.example.class06',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB08lOBxwtBl_LLUzeEoOBm9Xd3J_qUEf0',
    appId: '1:215717871275:ios:3d6848cb76aa11d27941ee',
    messagingSenderId: '215717871275',
    projectId: 'classsix',
    storageBucket: 'classsix.appspot.com',
    iosBundleId: 'com.example.class06',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD73KsrV53Q8yo385ws4Yij5e8omviGuak',
    appId: '1:215717871275:web:2414b0a47876b5877941ee',
    messagingSenderId: '215717871275',
    projectId: 'classsix',
    authDomain: 'classsix.firebaseapp.com',
    storageBucket: 'classsix.appspot.com',
  );
}
