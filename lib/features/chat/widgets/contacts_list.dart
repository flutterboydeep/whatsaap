import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsaap/features/chat/controller/chat_controller.dart';
import 'package:whatsaap/helper/helperClasses/loader.dart';
import 'package:whatsaap/layoutScreens/mobile_screen_layout.dart';
import 'package:whatsaap/models/chat_contact.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';
import 'package:whatsaap/info.dart';
import 'package:whatsaap/features/chat/screen/chatpage_str_mobile.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<ChatContacts>>(
        stream: ref.watch(chatControllerProvider).chatContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          }
          return ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              var chatContactData = snapshot.data![index];
              return Padding(
                padding: EdgeInsets.only(top: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    maxRadius: 30,
                    backgroundImage: NetworkImage(chatContactData.profilePic),
                  ),
                  title: Text(
                    chatContactData.name,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      // chatContactData.lastMessage.length > 22
                      //     ? chatContactData.lastMessage.trim().substring(0, 22)
                      chatContactData.lastMessage.trim(),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  trailing: Text(
                    DateFormat.Hm()
                        .format(DateTime.parse(chatContactData.timeSent)),
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  onTap: () {
                    if (MediaQuery.of(context).size.width > 938) {
                    } else {
                      Navigator.pushNamed(
                          context, ChatPageStructureMobile.routeName,
                          arguments: {
                            'name': chatContactData.name,
                            'uid': chatContactData.contactId,
                          });
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ChatPageStructureMobile(
                      //               name: 'pagel',
                      //               uid: '456',
                      //             )));
                    }
                  },
                ),
              );
            }),
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) {
              return Divider(
                color: dividerColor,
                indent: 80,
              );
            },
          );
        });
  }
}
