// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:whatsaap/features/chat/controller/chat_controller.dart';
import 'package:whatsaap/features/chat/widgets/my_message_in_chatList.dart';
import 'package:whatsaap/features/chat/widgets/sender_message_in_chatList.dart';
import 'package:whatsaap/helper/helperClasses/loader.dart';
import 'package:whatsaap/info.dart';

class ChatList extends ConsumerWidget {
  final String recieverUserId;
  ChatList({
    Key? key,
    required this.recieverUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.read(chatControllerProvider).chatStream(recieverUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final messageData = snapshot.data![index];
              var timeSend = DateFormat.Hm().format(messageData.timeSent);
              // if (messages[index]['isMe'] == true) {
              if (messageData.senderId ==
                  FirebaseAuth.instance.currentUser!.uid) {
                return MyMessageInChatList(
                  message: messageData.text,
                  // message: messages[index]['text'].toString(),
                  // date: messages[index]['time'].toString(),
                  date: timeSend,
                );
              } else {
                return SenderMessageInChatList(
                  message: messageData.text,
                  // message: messages[index]['text'].toString(),
                  // date: messages[index]['time'].toString(),
                  date: timeSend,
                );
              }
            },
            itemCount: snapshot.data!.length,
          );
        });
  }
}
