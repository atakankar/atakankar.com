import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCwu3T_cXj03_jDlhoIZugZVBbJA1dI8aM",
          authDomain: "atakankar-160fe.firebaseapp.com",
          projectId: "atakankar-160fe",
          storageBucket: "atakankar-160fe.appspot.com",
          messagingSenderId: "985222197442",
          appId: "1:985222197442:web:db892abc23ae83f1478b5b"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const App());
}
