import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';
import 'package:whatsaap/features/chat/widgets/chat_list.dart';
import 'package:whatsaap/features/chat/widgets/contacts_list.dart';
import 'package:whatsaap/widgets/commonWidget/send_message_box.dart';
import 'package:whatsaap/widgets/web/web_chat_appBar.dart';
import 'package:whatsaap/widgets/web/web_profileBar.dart';
import 'package:whatsaap/widgets/web/web_searchbar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: appBarColor,
        //   title: const Text(
        //     "Whatsaap",
        //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        //   ),
        // ),
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                WebProfileBar(),
                WebSearchBar(),
                ContactsList(),
              ],
            ),
          ),
        ),
        Container(
            // width: 200,
            // height: 300,
            width: MediaQuery.sizeOf(context).width * 0.75,
            // height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/assets/images/backgroundImage.png"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                WebChatAppBar(),
                Expanded(
                    child: ChatList(
                  recieverUserId: '',
                )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: dividerColor)),
                    color: chatBarMessage,
                  ),
                  child: SendMessageBox(),
                )
              ],
            ))
      ],
    ));
  }
}
