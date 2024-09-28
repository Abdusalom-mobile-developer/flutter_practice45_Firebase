import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice45_firabase/config/widgets.dart';
import 'package:flutter_practice45_firabase/screens/home.dart';
import 'package:flutter_practice45_firabase/screens/sign_in.dart';
import 'package:flutter_practice45_firabase/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "/sign_up_screen";
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with CustomWidgets {
  final FocusNode _focusNode = FocusNode();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
          Colors.black.withOpacity(0.86),
          Colors.grey[900]!.withOpacity(0.87),
          Colors.black.withOpacity(0.817),
        ])),
        child: Stack(
          children: [
            _isLoading
                ? const SizedBox.shrink()
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 3.7,
                        ),
                        Text(
                          "Sign up.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width / 10,
                              fontWeight: FontWeight.bold),
                        ),
                        textFieldCustom(context, "Email", _emailController,
                            focusNode: _focusNode),
                        textFieldCustom(
                            context, "Password", _passwordController,
                            isHidden: true),
                        textFieldCustom(
                            context, "Confirm Password", _cpasswordController,
                            isHidden: true),
                        customButton(context, () async {
                          if (_emailController.text
                                  .trim()
                                  .contains("@gmail.com") &&
                              _passwordController.text.trim().length > 6 &&
                              _passwordController.text.trim() ==
                                  _cpasswordController.text.trim()) {
                            await AuthService.signUp(
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                            setState(() {
                              _isLoading = true;
                            });
                            Timer(
                              const Duration(milliseconds: 600),
                              () {
                                Navigator.pushReplacementNamed(
                                    context, HomeScreen.id);
                              },
                            );
                          }
                          _emailController.clear();
                          _passwordController.clear();
                          _cpasswordController.clear();
                        }, "Sign up"),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize:
                                    MediaQuery.of(context).size.width / 21,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 28,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, SignInScreen.id);
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 21,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    ));
  }
}
