import 'package:flutter/material.dart';

mixin CustomWidgets {
  Widget textFieldCustom(
      BuildContext context, String hint, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 17),
      padding: const EdgeInsets.only(left: 9),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width / 5.9,
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(4)),
      child: TextField(
        controller: controller,
        cursorColor: Colors.white38,
        style: const TextStyle(
            color: Colors.white54,
            fontSize: 20,
            decoration: TextDecoration.none,
            decorationThickness: 0),
        decoration: InputDecoration(
            border: const UnderlineInputBorder(borderSide: BorderSide.none),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54, fontSize: 20)),
      ),
    );
  }
}
