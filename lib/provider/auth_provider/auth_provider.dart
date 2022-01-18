// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:new_project1/Routes/routes.dart';

// import 'auth_state.dart';

// class AuthProvider extends Cubit {
//   final firebaseAuth = FirebaseAuth.instance;
//   AuthProvider(AuthState state) : super(state);

//   Future<void> splashInit(BuildContext context) async {
//     await Future.delayed(const Duration(seconds: 1), () {
//       Navigator.pushReplacementNamed(context, Routes.signupScreen);
//     });
//   }

//   Future<void> login() async {

//   }

// }
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_project1/Routes/routes.dart';
import 'package:new_project1/network/network.dart';
import 'package:new_project1/widgets/auth_widget/login.dart';

class AuthProvider with ChangeNotifier {
  final firebaseAuth = Network();
  int _selectedIndex = 0;
  int selectedindex = 0;
  //int _currentIndex = 0;
  void OnPageChanged(index, reason) {
    _selectedIndex = index;
  }

  void OnTappedItem(int index) {
    selectedindex = index;
  }

  Future<void> splashInit(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, Routes.authenticationscreen);
    });
  }

  Future<void> register(BuildContext context,
      {required String password, required String email}) async {
    try {
      showAlertaDialog(context);
      await firebaseAuth.register(email: email, password: password);
      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.investmentscreen, (route) => false);
    } on FirebaseAuthException catch (e) {
      log("Error signup");
    }
  }

  Future<void> login(
    BuildContext context, {
    required String password,
    required String email,
  }) async {
    try {
      showAlertaDialog(context);
      Navigator.pop(context);
      await firebaseAuth.login(password: password, email: email);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.investmentscreen, (route) => false);
    } on FirebaseException catch (e) {
      log("Error login");
    }
  }

  void signout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.authenticationscreen, (route) => false);
  }
}
