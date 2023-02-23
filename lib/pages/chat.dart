import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import '../constants/colors.dart';
import '../model/message.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final channel = IOWebSocketChannel.connect("ws://127.0.0.1:7890/SendMessage");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamListener();
  }

  streamListener() {
    channel.stream.listen((msg) {
      setState(() {
        Map stringToJson = jsonDecode(msg);

        messages.add(Message(message: stringToJson['message'], idUser: stringToJson['idUser']));
      });
    });
  }

  final messages = Message.getListMessage();
  final _messageController = TextEditingController();
  final _focusNodeController = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: tdBGColor,
          padding: const EdgeInsets.only(bottom: 75),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              for (Message messagee in messages)
                message(messagee.message, messagee.idUser)
            ]),
          ),
        ),
        Align(alignment: Alignment.bottomCenter, child: inputMessage())
      ]),
    );
  }

  Widget message(String msg, int id) {
    return Container(
      width: double.infinity,
      alignment: id != 0 ? Alignment.centerLeft : Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: tdLightGrey, borderRadius: BorderRadius.circular(10)),
        child: Text(msg),
      ),
    );
  }

  Widget inputMessage() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: tdLightGrey, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        focusNode: _focusNodeController,
        controller: _messageController,
        onSubmitted: (String msg) {
          _sendNewMessage(msg, 0);
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(2),
            suffixIcon: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.send,
                color: tdBlack,
                size: 20,
              ),
            ),
            suffixIconConstraints:
                const BoxConstraints(minHeight: 20, minWidth: 20),
            border: InputBorder.none,
            hintText: "Escreva sua Mensagem",
            hintStyle: const TextStyle(color: tdGrey)),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 2,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Flutter WebSockets Chat",
            style: TextStyle(color: tdBlack),
          )
        ],
      ),
    );
  }

  void _sendNewMessage(String msg, int id) {
    String jsonToString = jsonEncode(Message(message: msg, idUser: id));
    channel.sink.add(jsonToString);
    _messageController.clear();
    _focusNodeController.requestFocus();
  }
}
