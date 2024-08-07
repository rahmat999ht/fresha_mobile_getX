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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDz0-WivRnuzjpv9LZNSZkwPb1KnvMjDUI',
    appId: '1:31931713308:android:4f15d1f45319ad6b9b1cd9',
    messagingSenderId: '31931713308',
    projectId: 'fresha-412308',
    storageBucket: 'fresha-412308.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrjZ7NU5Usydq7r1H6EQZPnjp9js66Rhw',
    appId: '1:31931713308:ios:a05c5cbf8be9846f9b1cd9',
    messagingSenderId: '31931713308',
    projectId: 'fresha-412308',
    storageBucket: 'fresha-412308.appspot.com',
    androidClientId:
        '31931713308-agj6a3c1rikul9gt36odtfhk3ap89snu.apps.googleusercontent.com',
    iosClientId:
        '31931713308-mem55k8s2gt1rmvb13fbvsqbc024vi7a.apps.googleusercontent.com',
    iosBundleId: 'yayat.tech.freshaMobile',
  );
}
