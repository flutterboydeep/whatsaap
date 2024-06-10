import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/helper/utils/utils.dart';
import 'package:whatsaap/layoutScreens/mobile_screen_layout.dart';
import 'package:whatsaap/models/user_model.dart';
import 'package:whatsaap/widgets/app/chatpage_str_mobile.dart';
import 'package:whatsaap/widgets/commonWidget/chat_list.dart';

final selectContactRepositoryProvider = Provider(
    (ref) => SelectContactRepository(firestore: FirebaseFirestore.instance));

class SelectContactRepository {
  final FirebaseFirestore firestore;
  SelectContactRepository({
    required this.firestore,
  });

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      log(e.toString());
      debugPrint(e.toString());
    }
    return contacts;
  }

  void onTapOnContact(
      Contact selectedContact, BuildContext context, String phoneCode) async {
    try {
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;
      for (var document in userCollection.docs) {
        final userData = UserModel.fromMap(document.data());
        // var removeSpecialCharsPhoneNum = selectedContact.phones[0].number.replace(/[^\d]/g, "");
        var selectedPhoneNum =
            selectedContact.phones[0].number.replaceAll(RegExp(r'[^\d]'), '');
        var selectedPhoneNumWithCountryCode = '$phoneCode$selectedPhoneNum';
        // var removeBraketsPhoneNum=removeSpacePhoneNum.replaceAll("");
        log("this is doucument data before usermodel=${document.data}");
        log("This is userData= $userData");
        log(selectedPhoneNumWithCountryCode);
        if (selectedPhoneNumWithCountryCode == userData.phoneNumber) {
          Navigator.pushNamed(context, ChatPageStructureMobile.routeName,
              arguments: {
                'name': userData.name,
                'uid': userData.uid,
              });
          isFound = true;
          break;
        }
      }
      if (!isFound) {
        showSnackBar(
            context: context,
            content: "This number don't have WhatsApp Accout !");
      }
    } catch (e) {
      log(e.toString());
      showSnackBar(context: context, content: e.toString());
    }
  }
}
