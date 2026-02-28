import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCiMAsczmpsaGixTzicbvM_x070Kvor2Zs',
    appId: '1:254382477367:android:475b9344921e1811aa6fb2',
    messagingSenderId: '254382477367',
    projectId: 'buuble-3aae3',
    storageBucket: 'buuble-3aae3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDh8wI_xcbvL40K-ZozMOFRzHBRFhuGp4w',
    appId: '1:254382477367:ios:44b6f5b962af2906aa6fb2',
    messagingSenderId: '254382477367',
    projectId: 'buuble-3aae3',
    storageBucket: 'buuble-3aae3.firebasestorage.app',
    iosClientId:
        '254382477367-5qbq6f1keepojob688c5f37lc2dugqdd.apps.googleusercontent.com',
    iosBundleId: 'com.example.zerochat',
  );
}
