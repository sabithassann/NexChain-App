
// This file will handle the initialization and configuration of Firebase.

import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyBIYtwcTcsYaVta76nmZZUFeALrdNOuQkI',
        appId: '1:425281115650:android:282f3e13d0c99f732b391b',
        messagingSenderId: '425281115650',
        projectId: 'flutter-9dead',
        storageBucket: 'flutter-9dead.appspot.com',
      ),
    );
  }
}