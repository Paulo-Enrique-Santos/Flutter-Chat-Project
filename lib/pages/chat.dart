import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../model/message.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
                message(messagee.message, false)
            ]),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: inputMessage()
        )
      ]),
    );
  }

  Widget message(String msg, bool received) {
    return Container(
      width: double.infinity,
      alignment: received ? Alignment.centerLeft : Alignment.centerRight,
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
          _sendNewMessage(msg);
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
            suffixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 20),
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

  void _sendNewMessage(String msg) {
    setState(() {
      messages.add(Message(message: msg));
    });
    _messageController.clear();
    _focusNodeController.requestFocus();
  }
}
