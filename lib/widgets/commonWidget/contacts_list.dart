import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsaap/screens/mobile_screen_layout.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';
import 'package:whatsaap/info.dart';
import 'package:whatsaap/widgets/app/chatpage_str_mobile.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 10),
          child: ListTile(
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundImage: NetworkImage(info[index]['profilePic']!),
            ),
            title: Text(
              info[index]['name'].toString(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                info[index]['message'].toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            trailing: Text(
              info[index]['time'].toString(),
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            onTap: () {
              if (MediaQuery.of(context).size.width > 938) {
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPageStructureMobile()));
              }
            },
          ),
        );
      }),
      itemCount: info.length,
      separatorBuilder: (context, index) {
        return Divider(
          color: dividerColor,
          indent: 80,
        );
      },
    );
  }
}
