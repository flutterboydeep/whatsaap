import 'package:flutter/material.dart';

import 'package:whatsaap/widgets/commonWidget/colors.dart';

class MyMessageInChatList extends StatelessWidget {
  final String message;
  final String date;

  const MyMessageInChatList(
      {super.key, required this.message, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.20),
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
          child: Card(
            elevation: 2,
            color: messageColor,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8))),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 30, top: 5, bottom: 20),
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Positioned(
                      right: 5,
                      bottom: 2,
                      child: Row(
                        children: [
                          Text(
                            date,
                            style:
                                TextStyle(fontSize: 11, color: Colors.white60),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.done_all,
                            size: 16,
                            color: Colors.white60,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
