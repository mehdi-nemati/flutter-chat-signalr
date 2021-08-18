import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loginTextInputWidget(
    Size size, TextEditingController usernameTextController) {
  return Padding(
    padding: const EdgeInsets.only(top: 0, left: 50, right: 50),
    child: Container(
      height: 60,
      width: size.width,
      child: TextField(
        maxLength: 25,
        controller: usernameTextController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(32),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(32),
          ),
          filled: true,
          hintText: "Enter your name",
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(160),
          ),
        ),
      ),
    ),
  );
}
