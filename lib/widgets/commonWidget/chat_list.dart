import 'package:flutter/cupertino.dart';
import 'package:whatsaap/info.dart';
import 'package:whatsaap/widgets/commonWidget/my_message_in_chatList.dart';
import 'package:whatsaap/widgets/commonWidget/sender_message_in_chatList.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (messages[index]['isMe'] == true) {
          return MyMessageInChatList(
            message: messages[index]['text'].toString(),
            date: messages[index]['time'].toString(),
          );
        } else {
          return SenderMessageInChatList(
            message: messages[index]['text'].toString(),
            date: messages[index]['time'].toString(),
          );
        }
      },
      itemCount: messages.length,
    );
  }
}
