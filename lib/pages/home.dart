import 'package:flutter/material.dart';
import 'package:flutter_chat_project/constants/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        width: double.infinity,
        color: tdBGColor,
        padding: const EdgeInsets.only(top: 15),
        child: const Column(
          children: [
            
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 1,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Text(
            "Chats",
            style: TextStyle(color: tdBlack),
          ),
          Icon(
            Icons.search,
            color: tdBlack,
            size: 30,
          )
        ],
      ),
    );
  }
}
