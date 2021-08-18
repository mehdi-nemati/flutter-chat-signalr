import 'package:chat_app/utils/appTheme.dart';
import 'package:flutter/cupertino.dart';

Widget loginHeaderWidget() {
  return Padding(
    padding: const EdgeInsets.only(top: 64),
    child: Text(
      'Flutter Chat App',
      style: AppTheme.loginTitleStyle,
    ),
  );
}
