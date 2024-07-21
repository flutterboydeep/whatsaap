import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/enums/message_enum.dart';
import 'package:whatsaap/features/chat/controller/chat_controller.dart';
import 'package:whatsaap/helper/utils/utils.dart';
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
  bool isShowEmojiContainer = false;
  bool isTextFilledFoced = false;
  bool isEmojiSearching = false;
  FocusNode focusNode = FocusNode();

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

  void sendFileMessage(
    File file,
    MessageEnum messageEnum,
  ) {
    ref
        .read(chatControllerProvider)
        .sendFileMessage(context, file, widget.recieverUserId, messageEnum);
  }

  void selectImage() async {
    File? image = await pickImageFromGallery(context);
    if (image != null) {
      sendFileMessage(image, MessageEnum.image);
    }
  }

  void selectVideo() async {
    File? video = await pickVideoFromGallery(context);
    if (video != null) {
      sendFileMessage(video, MessageEnum.video);
    }
  }

  addListener() {
    setState(() {
      isTextFilledFoced = focusNode.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(addListener);
  }

  @override
  void dispose() {
    focusNode.removeListener(addListener);
    super.dispose();
    chatTextFieldCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 15, top: 5),
                child: Center(
                  child: TextField(
                    focusNode: focusNode,
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
                      hintText: 'Messages',
                      hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      prefixIcon: IconButton(
                          onPressed: toggleEmojiKeyboardContainer,
                          icon: Icon(Icons.emoji_emotions_outlined)),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: selectVideo,
                              icon: Icon(Icons.attach_file)),
                          isShowSendButton == false
                              ? CircleAvatar(
                                  radius: 13,
                                  backgroundColor:
                                      Color.fromARGB(255, 197, 196, 196),
                                  child: Text(
                                    "₹",
                                    style: TextStyle(
                                        fontSize: 21, color: appBarColor),
                                  ))
                              : SizedBox(),
                          isShowSendButton == false
                              ? IconButton(
                                  onPressed: selectImage,
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
        ),
        (isTextFilledFoced && isShowEmojiContainer)
            ? SizedBox(
                height: 150,
                child: emojipicker(),
              )
            : (isShowEmojiContainer &&
                    isEmojiSearching &&
                    isTextFilledFoced == false)
                ? SizedBox(
                    height: 110,
                    child: emojipicker(),
                  )
                : (isShowEmojiContainer && isTextFilledFoced == false)
                    ? SizedBox(
                        height: 350,
                        child: emojipicker(),
                      )
                    : isShowEmojiContainer
                        ? SizedBox(
                            height: 350,
                            child: emojipicker(),
                          )
                        : const SizedBox(),
      ],
    );
  }

  emojipicker() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: EmojiPicker(
        config: Config(
            searchViewConfig: SearchViewConfig(
              // customSearchView: (config, state, showEmojiView) {
              //   return Container(
              //     color: Colors.grey[200],
              //     padding: EdgeInsets.all(8.0),
              //     child: Column(
              //       children: [
              //         TextField(
              //           decoration: InputDecoration(
              //             border: OutlineInputBorder(),
              //             hintText: 'Search emojis...',
              //           ),
              //           onChanged: (query) {

              //           },
              //         ),
              //       ],
              //     ),
              //   );
              // },
              backgroundColor: backgroundColor,
              buttonIconColor: textColor,
              hintText: "Search Emoji 😊",
            ),
            emojiViewConfig: EmojiViewConfig(
                emojiSizeMax: 33, backgroundColor: backgroundColor),
            swapCategoryAndBottomBar: false,
            bottomActionBarConfig: BottomActionBarConfig(
              enabled: true,
              showBackspaceButton: true,
              buttonColor: tabColor,
              backgroundColor: backgroundColor,
              customBottomActionBar: (config, state, showSearchView) {
                return Container(
                  color: chatBarMessage,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            isEmojiSearching = true;
                          });
                          showSearchView();
                        },
                      ),
                      IconButton(
                          icon: Icon(Icons.backspace),
                          onPressed: () {
                            setState(() {
                              isEmojiSearching = false;
                            });
                            onBackspacePressed();
                          }),

                      // Add other custom buttons or actions here
                    ],
                  ),
                );
              },
            )),
        onEmojiSelected: (category, emojis) {
          setState(() {
            chatTextFieldCtrl.text = chatTextFieldCtrl.text + emojis.emoji;
          });
          if (!isShowSendButton) {
            setState(() {
              isShowSendButton = true;
            });
          }
        },
      ),
    );
  }

  void showEmojiContainer() {
    setState(() {
      isShowEmojiContainer = true;
    });
  }

  void hideEmojiContainer() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showKeyboard() => focusNode.requestFocus();
  void hideKeyboard() => focusNode.unfocus();
  void toggleEmojiKeyboardContainer() {
    if (isShowEmojiContainer) {
      showKeyboard();
      hideEmojiContainer();
    } else {
      setState(() {
        isEmojiSearching = false;
      });
      hideKeyboard();
      showEmojiContainer();
    }
  }

  onBackspacePressed() {
    chatTextFieldCtrl.text =
        String.fromCharCodes(chatTextFieldCtrl.text.codeUnits);

    final textPointer = chatTextFieldCtrl.selection;
    final ctrlValue = chatTextFieldCtrl.text.trim();

    if (textPointer.baseOffset > 0) {
      setState(() {
        chatTextFieldCtrl.text =
            ctrlValue.replaceFirst(ctrlValue[textPointer.baseOffset - 1], "");
        chatTextFieldCtrl.selection =
            TextSelection.collapsed(offset: textPointer.baseOffset - 1);
      });
    }
  }
}
