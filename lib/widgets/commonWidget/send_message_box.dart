import 'package:flutter/material.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';

class SendMessageBox extends StatelessWidget {
  const SendMessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.emoji_emotions_outlined)),
        IconButton(onPressed: () {}, icon: Icon(Icons.attach_file)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 15),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: searchBarColor,
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  prefix: SizedBox(
                    width: 15,
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
        IconButton(onPressed: () {}, icon: Icon(Icons.send)),
      ],
    );
  }
}
