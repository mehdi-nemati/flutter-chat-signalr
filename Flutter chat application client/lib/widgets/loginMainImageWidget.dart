import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loginMainImageWidget(Size size) {
  return Container(
      height: size.height * .4,
      child: Image.asset(
        'assets/images/chat2.png',
        color: Colors.white,
        width: size.width * .5,
      ));
}
