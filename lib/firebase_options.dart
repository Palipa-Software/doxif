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
    apiKey: 'AIzaSyBwJjnxbFQHXKaz_4QgnugGgvpxRnWxw_k',
    appId: '1:165191797199:android:99711db8fdaa270708aaba',
    messagingSenderId: '165191797199',
    projectId: 'doxif-2a9f5',
    databaseURL: 'https://doxif-2a9f5-default-rtdb.firebaseio.com',
    storageBucket: 'doxif-2a9f5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClr1L71OPV_0MQwiUtYo3VoIsx_b2cS_E',
    appId: '1:165191797199:ios:b7110cd79b1ce0f508aaba',
    messagingSenderId: '165191797199',
    projectId: 'doxif-2a9f5',
    databaseURL: 'https://doxif-2a9f5-default-rtdb.firebaseio.com',
    storageBucket: 'doxif-2a9f5.appspot.com',
    androidClientId: '165191797199-8k90j73cs09omg05e0lq344mmvlrje4u.apps.googleusercontent.com',
    iosClientId: '165191797199-62128nqvkpniadf4cqubu388mn8ca0o6.apps.googleusercontent.com',
    iosBundleId: 'com.palipasoftware.seramcepte',
  );
}
