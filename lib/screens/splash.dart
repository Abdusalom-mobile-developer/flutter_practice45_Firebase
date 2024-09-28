import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice45_firabase/screens/home.dart';
import 'package:flutter_practice45_firabase/screens/sign_in.dart';
import 'package:flutter_practice45_firabase/services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "/splash_screen";
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkIfLoggedIn();
  }

  void checkIfLoggedIn() async {
    bool isLoggedin = await AuthService.isLoggedIn();
    Timer(
      const Duration(seconds: 2),
      () {
        if (isLoggedin) {
          Navigator.pushReplacementNamed(context, HomeScreen.id);
        } else {
          Navigator.pushReplacementNamed(context, SignInScreen.id);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
          Colors.black.withOpacity(0.86),
          Colors.grey[900]!.withOpacity(0.87),
          Colors.black.withOpacity(0.817),
        ])),
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: Text(
                "Welcome.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 5.7,
                    fontWeight: FontWeight.bold),
              ),
            )),
            const Text(
              "All right reserved",
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              ),
            ),
            const SizedBox(
              height: 17,
            ),
          ],
        ),
      ),
    );
  }
}
