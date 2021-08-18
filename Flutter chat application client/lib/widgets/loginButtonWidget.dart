import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loginButtonWidget(Size size, Function onTap) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () => onTap(),
    child: Padding(
      padding: const EdgeInsets.only(top: 16, right: 50, left: 50, bottom: 16),
      child: Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        alignment: Alignment.center,
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Text(
              'Enter to chat',
              style: TextStyle(
                color: Color(0xff207b7d),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xff207b7d),
              size: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
