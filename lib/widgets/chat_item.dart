import 'package:flutter/material.dart';
import 'package:flutter_chat_project/constants/colors.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 95,
      child: Column(children: [
        Material(
          color: tdBGColor,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: tdRed, borderRadius: BorderRadius.circular(50)),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 2, top: 15),
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "João",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: tdBlack,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "11:50",
                              style: TextStyle(color: tdBlack),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "João",
                            style: TextStyle(fontSize: 16, color: tdGrey),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: tdLightGrey,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              "1",
                              style: TextStyle(fontSize: 10, color: tdWhite),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          height: 5,
          indent: 30,
          endIndent: 30,
          color: Color.fromARGB(255, 199, 199, 199),
        )
      ]),
    );
  }
}
