import 'package:flutter/material.dart';

mixin CustomWidgets {
  Widget textFieldCustom(
      BuildContext context, String hint, TextEditingController controller, 
      {FocusNode? focusNode, bool isHidden = false}) {
    return Container(
      margin: const EdgeInsets.only(top: 17),
      padding: const EdgeInsets.only(left: 9),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width / 5.9,
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(4)),
      child: TextField(
        obscureText: isHidden,
        focusNode: focusNode,
        autofocus: true,
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

  Widget customButton(
      BuildContext context, void Function() function, String text) {
    return Container(
      margin: const EdgeInsets.only(top: 17),
      height: MediaQuery.of(context).size.width / 5.9,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(4)),
      child: TextButton(
          onPressed: function,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
