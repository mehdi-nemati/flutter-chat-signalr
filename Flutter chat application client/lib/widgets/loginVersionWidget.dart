import 'package:chat_app/utils/appTheme.dart';
import 'package:flutter/cupertino.dart';

Widget loginVersionWidget() {
  return Expanded(
      child: Container(
    child: Padding(
      padding: EdgeInsets.only(bottom: 32),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'version 1.0.0',
          style: AppTheme.loginHelpStyle,
        ),
      ),
    ),
  ));
}
