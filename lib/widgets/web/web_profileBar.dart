import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';

class WebProfileBar extends StatelessWidget {
  const WebProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.30,
      height: MediaQuery.sizeOf(context).height * 0.077,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: webAppBarColor,
          border: Border(
            right: BorderSide(
              color: Color(0xff1F2C34),
              width: 5,
            ),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?auto=compress%2Cformat&ixlib=php-3.3.0"),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
              SizedBox(
                width: 8,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          )
        ],
      ),
    );
  }
}
