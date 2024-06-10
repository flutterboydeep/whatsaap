import 'package:flutter/material.dart';
import 'package:whatsaap/features/select_contacts/screen/select_contacts_screen.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';

import 'package:whatsaap/widgets/commonWidget/contacts_list.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: appBarColor,
          title: const Text(
            "Whatsaap",
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.grey,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
                color: Colors.grey)
          ],
          bottom: TabBar(
            indicatorColor: tabColor,
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: tabColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALL'),
              // Text("CHATS"),
              // Text("STATUS"),
              // Text("CALL"),
            ],
          ),
        ),
        body: ContactsList(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: tabColor,
          onPressed: () {
            Navigator.pushNamed(context, SelectContactScreen.routeName);
          },
          child: Icon(Icons.comment),
        ),
      ),
    );
  }
}
