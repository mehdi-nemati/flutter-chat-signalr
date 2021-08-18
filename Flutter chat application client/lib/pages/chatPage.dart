import 'dart:convert';
import 'dart:math';

import 'package:chat_app/models/messageModel.dart';
import 'package:chat_app/utils/removeMessageExtraChar.dart';
import 'package:chat_app/widgets/chatAppbarWidget.dart';
import 'package:chat_app/widgets/chatMessageListWidget.dart';
import 'package:chat_app/widgets/chatTypeMessageWidget.dart';
import 'package:flutter/material.dart';
import 'package:signalr_core/signalr_core.dart';

class ChatPage extends StatefulWidget {
  final String userName;
  const ChatPage(this.userName, {Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    openSignalRConnection();
    createRandomId();
  }

  int currentUserId = 0;
  //generate random user id
  createRandomId() {
    Random random = Random();
    currentUserId = random.nextInt(999999);
  }

  ScrollController chatListScrollController = new ScrollController();
  TextEditingController messageTextController = TextEditingController();
  submitMessageFunction() async {
    var messageText = removeMessageExtraChar(messageTextController.text);
    await connection.invoke('SendMessage',
        args: [widget.userName, currentUserId, messageText]);
    messageTextController.text = "";

    Future.delayed(const Duration(milliseconds: 500), () {
      chatListScrollController.animateTo(
          chatListScrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            chatAppbarWidget(size, context),
            chatMessageWidget(
                chatListScrollController, messageModel, currentUserId),
            chatTypeMessageWidget(messageTextController, submitMessageFunction)
          ],
        ),
      ),
    );
  }

  //set url and configs
  final connection = HubConnectionBuilder()
      .withUrl(
          'http://192.168.1.102:5000/chatHub',
          HttpConnectionOptions(
            logging: (level, message) => print(message),
          ))
      .build();

  //connect to signalR
  Future<void> openSignalRConnection() async {
    await connection.start();
    connection.on('ReceiveMessage', (message) {
      _handleIncommingDriverLocation(message);
    });
    await connection.invoke('JoinUSer', args: [widget.userName, currentUserId]);
  }

  //get messages
  List<MessageModel> messageModel = [];
  Future<void> _handleIncommingDriverLocation(List<dynamic>? args) async {
    if (args != null) {
      var jsonResponse = json.decode(json.encode(args[0]));
      MessageModel data = MessageModel.fromJson(jsonResponse);
      setState(() {
        messageModel.add(data);
      });
    }
  }
}
