import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';
import 'package:whatsaap/info.dart';
import 'package:whatsaap/widgets/commonWidget/chat_list.dart';
import 'package:whatsaap/widgets/commonWidget/contacts_list.dart';
import 'package:whatsaap/widgets/commonWidget/send_message_box.dart';

class ChatPageStructureMobile extends StatelessWidget {
  static const String routeName = '/moblile-chat-page';
  const ChatPageStructureMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        centerTitle: false,
        title: Text(info[0]['name'].toString()),
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
            Expanded(child: ChatList()),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15, top: 5),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: mobileChatBoxColor,
                          hintText: 'Message',
                          hintStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.emoji_emotions_outlined)),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.attach_file)),
                              CircleAvatar(
                                  radius: 13,
                                  backgroundColor:
                                      Color.fromARGB(255, 197, 196, 196),
                                  child: Text(
                                    "₹",
                                    style: TextStyle(
                                        fontSize: 21, color: appBarColor),
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.camera_alt_outlined)),
                            ],
                          ),
                          contentPadding: EdgeInsets.all(2),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                    backgroundColor: tabColor,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.mic,
                          color: Colors.white,
                        ))),
              ],
            ),
            // Align(child: SendMessageBox()),
          ],
        ),
      ),
    );
  }
}
