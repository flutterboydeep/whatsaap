import 'package:flutter/material.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';

class WebSearchBar extends StatelessWidget {
  const WebSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.08,
      width: MediaQuery.sizeOf(context).width * 0.25,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          // color: Colors.blue,
          border: Border(bottom: BorderSide(color: dividerColor))),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18),
          ),
          hintText: "Search or start new chat",
          hintStyle: TextStyle(fontSize: 14),
          fillColor: searchBarColor,
          filled: true,
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
