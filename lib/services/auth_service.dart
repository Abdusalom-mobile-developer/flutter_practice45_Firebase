// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice45_firabase/screens/sign_in.dart';
import 'package:flutter_practice45_firabase/services/log_service.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static Future<bool> isLoggedIn() async {
    User? isLoggedIn = _auth.currentUser;

    if (isLoggedIn != null) {
      return true;
    }
    return false;
  }

  static Future<void> logOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, SignInScreen.id);
  }

  static Future<void> logIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    bool result = await AuthService.isLoggedIn();
    LogService.d(result.toString());
  }

  static Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    bool result = await AuthService.isLoggedIn();
    LogService.w(result.toString());
  }
}
