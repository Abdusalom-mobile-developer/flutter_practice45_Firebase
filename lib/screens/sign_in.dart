import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const String id = "/sign_in_screen";
  const SignInScreen({
    super.key,
  });

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
        child: Center(
          child: Text(
                  "Sign in.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 5.7,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
