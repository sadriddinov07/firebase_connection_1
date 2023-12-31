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
    apiKey: 'AIzaSyA2m0j-7zxc8HL9rYKabQknLfBmSK0BrLc',
    appId: '1:6306046179:web:8645d7fe073284432665d6',
    messagingSenderId: '6306046179',
    projectId: 'fir-connection-1-4bbcd',
    authDomain: 'fir-connection-1-4bbcd.firebaseapp.com',
    databaseURL: 'https://fir-connection-1-4bbcd-default-rtdb.firebaseio.com',
    storageBucket: 'fir-connection-1-4bbcd.appspot.com',
    measurementId: 'G-CZDX68RX3G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiIG0Qge1nuzXT0L0K14U_kloYR84ShSg',
    appId: '1:6306046179:android:75da99c03d8966912665d6',
    messagingSenderId: '6306046179',
    projectId: 'fir-connection-1-4bbcd',
    databaseURL: 'https://fir-connection-1-4bbcd-default-rtdb.firebaseio.com',
    storageBucket: 'fir-connection-1-4bbcd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwaAetkEmI1WzuDvOFzJ2KVjI0fmLA1LA',
    appId: '1:6306046179:ios:ce666cdf93420b672665d6',
    messagingSenderId: '6306046179',
    projectId: 'fir-connection-1-4bbcd',
    databaseURL: 'https://fir-connection-1-4bbcd-default-rtdb.firebaseio.com',
    storageBucket: 'fir-connection-1-4bbcd.appspot.com',
    iosBundleId: 'com.example.firebaseConnection1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCwaAetkEmI1WzuDvOFzJ2KVjI0fmLA1LA',
    appId: '1:6306046179:ios:1bffaaf701e85ed82665d6',
    messagingSenderId: '6306046179',
    projectId: 'fir-connection-1-4bbcd',
    databaseURL: 'https://fir-connection-1-4bbcd-default-rtdb.firebaseio.com',
    storageBucket: 'fir-connection-1-4bbcd.appspot.com',
    iosBundleId: 'com.example.firebaseConnection1.RunnerTests',
  );
}
