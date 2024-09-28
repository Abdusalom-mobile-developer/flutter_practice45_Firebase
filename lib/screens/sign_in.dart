// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_practice45_firabase/config/widgets.dart';
import 'package:flutter_practice45_firabase/screens/home.dart';
import 'package:flutter_practice45_firabase/services/auth_service.dart';
import 'package:flutter_practice45_firabase/services/log_service.dart';
import 'package:flutter_practice45_firabase/screens/sign_up.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "/sign_in_screen";
  const SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with CustomWidgets {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(begin: Alignment.bottomCenter, colors: [
              Colors.black.withOpacity(0.86),
              Colors.grey[900]!.withOpacity(0.87),
              Colors.black.withOpacity(0.817),
            ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3.7,
                ),
                Text(
                  "Sign in.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 10,
                      fontWeight: FontWeight.bold),
                ),
                textFieldCustom(context, "Email", _emailController,
                    focusNode: _focusNode),
                textFieldCustom(context, "Password", _passwordController),
                customButton(context, () async {
                  AuthService.logIn(_emailController.text.trim(),
                      _passwordController.text.trim());
                  bool result = await AuthService.isLoggedIn();
                  if (result) {
                    Navigator.pushReplacementNamed(context, HomeScreen.id);
                    _emailController.clear();
                  _passwordController.clear();
                  }
                }, "Sign in"),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 15,
                ),
                Row(
                  children: [
                    Text(
                      "Do not have an account?",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: MediaQuery.of(context).size.width / 21,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 28,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignUpScreen.id);
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 21,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
