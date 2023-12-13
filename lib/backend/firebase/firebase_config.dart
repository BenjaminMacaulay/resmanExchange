import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC_8RYIEce6WSTwmoa8lt-TKVTfklFEEU4",
            authDomain: "rexmanexchange-204ac.firebaseapp.com",
            projectId: "rexmanexchange-204ac",
            storageBucket: "rexmanexchange-204ac.appspot.com",
            messagingSenderId: "413514666753",
            appId: "1:413514666753:web:a86c2c5dc39b69950e0100",
            measurementId: "G-3EJPX5CYKF"));
  } else {
    await Firebase.initializeApp();
  }
}
