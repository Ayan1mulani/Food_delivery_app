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
    apiKey: 'AIzaSyBfb4T_FlkdH0ub2NfQ8DVAcU6Z_R5KXwM',
    appId: '1:227647439008:web:235d9d1bbe7c53389a89c5',
    messagingSenderId: '227647439008',
    projectId: 'foodcourt-79dcf',
    authDomain: 'foodcourt-79dcf.firebaseapp.com',
    storageBucket: 'foodcourt-79dcf.appspot.com',
    measurementId: 'G-Y1QZYD57S8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBd_W74AtNqoodKNcGsMFcv8VOa9hOuvPY',
    appId: '1:227647439008:android:ceb1c61d92690df19a89c5',
    messagingSenderId: '227647439008',
    projectId: 'foodcourt-79dcf',
    storageBucket: 'foodcourt-79dcf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClwQ_WsON8bafLh7wyUicuRtlq3_or1mc',
    appId: '1:227647439008:ios:a2f4dab2939f85ce9a89c5',
    messagingSenderId: '227647439008',
    projectId: 'foodcourt-79dcf',
    storageBucket: 'foodcourt-79dcf.appspot.com',
    iosBundleId: 'com.example.foodCourt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClwQ_WsON8bafLh7wyUicuRtlq3_or1mc',
    appId: '1:227647439008:ios:a2f4dab2939f85ce9a89c5',
    messagingSenderId: '227647439008',
    projectId: 'foodcourt-79dcf',
    storageBucket: 'foodcourt-79dcf.appspot.com',
    iosBundleId: 'com.example.foodCourt',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBfb4T_FlkdH0ub2NfQ8DVAcU6Z_R5KXwM',
    appId: '1:227647439008:web:03d0bd20e00b6df19a89c5',
    messagingSenderId: '227647439008',
    projectId: 'foodcourt-79dcf',
    authDomain: 'foodcourt-79dcf.firebaseapp.com',
    storageBucket: 'foodcourt-79dcf.appspot.com',
    measurementId: 'G-85WX52SS6K',
  );
}
