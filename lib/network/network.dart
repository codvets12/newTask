import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_project1/model/data_model.dart';

class Network {
  final firebaseauth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
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

  Future<void> upLoadData(Data data) async {
    await firebaseFirestore.collection("data").doc().set(data.toJson());
  }
}
