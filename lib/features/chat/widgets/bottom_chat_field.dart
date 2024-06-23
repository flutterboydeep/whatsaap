import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/features/chat/controller/chat_controller.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';

class BottomChatField extends ConsumerStatefulWidget {
  final String recieverUserId;
  BottomChatField({super.key, required this.recieverUserId});

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  TextEditingController chatTextFieldCtrl = TextEditingController();
  bool isShowSendButton = false;

  void sendTextMessage() async {
    if (isShowSendButton) {
      ref.read(chatControllerProvider).sendTextMessage(
          context, chatTextFieldCtrl.text.trim(), widget.recieverUserId);
      setState(() {
        chatTextFieldCtrl.text = '';
      });

      // chatTextFieldCtrl.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    chatTextFieldCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 15, top: 5),
            child: Center(
              child: TextField(
                minLines: 1,
                maxLines: 4,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      isShowSendButton = true;
                    });
                  } else {
                    setState(() {
                      isShowSendButton = false;
                    });
                  }
                },
                controller: chatTextFieldCtrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: mobileChatBoxColor,
                  hintText: 'Message',
                  hintStyle: TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.emoji_emotions_outlined)),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.attach_file)),
                      isShowSendButton == false
                          ? CircleAvatar(
                              radius: 13,
                              backgroundColor:
                                  Color.fromARGB(255, 197, 196, 196),
                              child: Text(
                                "₹",
                                style:
                                    TextStyle(fontSize: 21, color: appBarColor),
                              ))
                          : SizedBox(),
                      isShowSendButton == false
                          ? IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.camera_alt_outlined))
                          : SizedBox()
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
        InkWell(
          onTap: sendTextMessage,
          onLongPress: () {},
          child: CircleAvatar(
              backgroundColor: tabColor,
              child: Icon(
                isShowSendButton == true ? Icons.send : Icons.mic,
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}
