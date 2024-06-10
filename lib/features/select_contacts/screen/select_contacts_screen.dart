import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/const.dart';
import 'package:whatsaap/features/auth/auth_screens/login_screen.dart';
import 'package:whatsaap/features/select_contacts/controller/select_contact_Controller.dart';
import 'package:whatsaap/helper/helperClasses/loader.dart';
import 'package:whatsaap/widgets/error_screen.dart';

class SelectContactScreen extends ConsumerWidget {
  static const String routeName = '/select-contact';
  const SelectContactScreen({super.key});

  void selectContact(WidgetRef ref, Contact selectedContact,
      BuildContext context, String countryCode) {
    ref
        .read(selectContactControllerProvider)
        .selectContact(selectedContact, context, countryCode);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryCode = ref.watch(numberCodeStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Contacts"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_sharp,
              color: iconColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: iconColor,
            ),
          ),
        ],
      ),
      body: ref.watch(getContactsProvider).when(data: (contactList) {
        return ListView.builder(
          itemCount: contactList.length,
          itemBuilder: ((context, index) {
            final contact = contactList[index];
            final firstChar =
                contact.displayName.characters.first.toUpperCase();

            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListTile(
                onTap: () {
                  selectContact(ref, contact, context, countryCode);
                },
                // leading: CircleAvatar(
                //   child: Text(firstChar.toString()),
                // ),
                leading: contact.photo == null
                    ? CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage("lib/assets/images/NoPerson.jpg"),
                      )
                    : CircleAvatar(
                        radius: 25,
                        backgroundImage: MemoryImage(contact.photo!),
                      ),
                title: Text(contact.displayName),
              ),
            );
          }),
        );
      }, error: (err, trace) {
        return ErrorScreen(
          error: err,
        );
      }, loading: () {
        return Loader();
      }),
    );
  }
}
