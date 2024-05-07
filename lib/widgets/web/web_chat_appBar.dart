import 'package:flutter/material.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';
import 'package:whatsaap/info.dart';

class WebChatAppBar extends StatelessWidget {
  const WebChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.75,
      height: MediaQuery.sizeOf(context).height * 0.077,
      decoration: BoxDecoration(
        color: webAppBarColor,
      ),
      padding: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(info[0]['profilePic']!),
        ),
        title: Text(info[0]['name'].toString()),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
      ),
    );
  }
}
