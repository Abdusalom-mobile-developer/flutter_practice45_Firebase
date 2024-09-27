import 'package:flutter/material.dart';
import 'package:flutter_practice45_firabase/screens/sign_in.dart';
import 'package:flutter_practice45_firabase/screens/splash.dart';
import 'package:flutter_practice45_firabase/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
      },
    );
  }
}
