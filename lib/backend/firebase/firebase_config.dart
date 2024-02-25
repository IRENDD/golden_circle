import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDPo3rw36ETMxemLlvGuYsSinfoLYjWePI",
            authDomain: "flutter-test-2df03.firebaseapp.com",
            projectId: "flutter-test-2df03",
            storageBucket: "flutter-test-2df03.appspot.com",
            messagingSenderId: "619914243267",
            appId: "1:619914243267:web:d469c73f1943327fa8c676",
            measurementId: "G-HEZCN78MWW"));
  } else {
    await Firebase.initializeApp();
  }
}
