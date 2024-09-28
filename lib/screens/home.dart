import 'package:flutter/material.dart';
import 'package:flutter_practice45_firabase/config/widgets.dart';
import 'package:flutter_practice45_firabase/services/auth_service.dart';
import 'package:flutter_practice45_firabase/services/log_service.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "/home_screen";
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with CustomWidgets {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Home Screen",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  AuthService.logOut(context);
                },
                icon: const Icon(
                  Icons.logout_rounded,
                  color: Colors.red,
                  size: 32,
                ))
          ],
        ),
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
              child: Center(
                child: Text(
                  "Home Screen.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 10,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ));
  }
}
