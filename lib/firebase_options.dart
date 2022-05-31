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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCmkyewFsJMuwe6JdJi-T8i6rbAoCp_1Sw',
    appId: '1:1041745834412:ios:252f667436a11288a50a09',
    messagingSenderId: '1041745834412',
    projectId: 'weather-app-a6843',
    authDomain:
        '1041745834412-lcsa1fb0oc67f28ki6jurpus0t280kb4.apps.googleusercontent.com',
    databaseURL:
        '1041745834412-lcsa1fb0oc67f28ki6jurpus0t280kb4.apps.googleusercontent.com',
    storageBucket: 'weather-app-a6843.appspot.com',
    measurementId: 'xxxxxxxxxxxxxxxxxxx',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmkyewFsJMuwe6JdJi-T8i6rbAoCp_1Sw',
    appId: '1:1041745834412:ios:252f667436a11288a50a09',
    messagingSenderId: '1041745834412',
    projectId: 'weather-app-a6843',
    databaseURL:
        '1041745834412-lcsa1fb0oc67f28ki6jurpus0t280kb4.apps.googleusercontent.com',
    storageBucket: 'weather-app-a6843.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmkyewFsJMuwe6JdJi-T8i6rbAoCp_1Sw',
    appId: '1:1041745834412:ios:252f667436a11288a50a09',
    messagingSenderId: '1041745834412',
    projectId: 'weather-app-a6843',
    databaseURL:
        '1041745834412-lcsa1fb0oc67f28ki6jurpus0t280kb4.apps.googleusercontent.com',
    storageBucket: 'weather-app-a6843.appspot.com',
    androidClientId:
        '1041745834412-lcsa1fb0oc67f28ki6jurpus0t280kb4.apps.googleusercontent.com',
    iosClientId:
        '1041745834412-lcsa1fb0oc67f28ki6jurpus0t280kb4.apps.googleusercontent.com',
    iosBundleId: 'com.example.weatherApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmkyewFsJMuwe6JdJi-T8i6rbAoCp_1Sw',
    appId: '1:1041745834412:ios:252f667436a11288a50a09',
    messagingSenderId: '1041745834412',
    projectId: 'weather-app-a6843',
    databaseURL:
        '1041745834412-lcsa1fb0oc67f28ki6jurpus0t280kb4.apps.googleusercontent.com',
    storageBucket: 'weather-app-a6843.appspot.com',
    androidClientId:
        '1041745834412-lcsa1fb0oc67f28ki6jurpus0t280kb4.apps.googleusercontent.com',
    iosClientId:
        '1041745834412-lcsa1fb0oc67f28ki6jurpus0t280kb4.apps.googleusercontent.com',
    iosBundleId: 'com.example.weatherApp',
  );
}
