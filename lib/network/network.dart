import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Network {
  final firebaseauth = FirebaseAuth.instance;
  Future<void> register(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  Future<void> login({required String password, required String email}) async {
    await firebaseauth.signInWithEmailAndPassword(
        email: email, password: password);
  }
  
}
