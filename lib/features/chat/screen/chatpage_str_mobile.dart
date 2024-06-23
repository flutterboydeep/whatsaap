import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/features/auth/controller/auth_controller.dart';
import 'package:whatsaap/features/chat/widgets/bottom_chat_field.dart';

import 'package:whatsaap/models/user_model.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';

import 'package:whatsaap/features/chat/widgets/chat_list.dart';

class ChatPageStructureMobile extends ConsumerWidget {
  static const String routeName = '/moblile-chat-page';

  final String name;
  final String uid;

  ChatPageStructureMobile({super.key, required this.name, required this.uid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("I am rebuiding again");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        centerTitle: false,
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text(
                  "Offline",
                  style: TextStyle(fontSize: 13),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name),
                    Text(
                      snapshot.data!.isOnline ? "online" : "offline",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                );
              }
            }),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.videocam_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.phone_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 8, right: 5),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/backgroundImage.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Expanded(
                child: ChatList(
              recieverUserId: uid,
            )),
            BottomChatField(
              recieverUserId: uid,
            ),
            // Align(child: SendMessageBox()),
          ],
        ),
      ),
    );
  }
}
