import 'package:chat_app/utils/appTheme.dart';
import 'package:flutter/cupertino.dart';

Widget loginSubtitleWidget() {
  return Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Text(
      'Flutter - ASP.NET Core - signalR',
      style: AppTheme.loginSubTitleTitleStyle,
    ),
  );
}
