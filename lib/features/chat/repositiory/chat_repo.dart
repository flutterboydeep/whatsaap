// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsaap/enums/message_enum.dart';
import 'package:whatsaap/helper/utils/utils.dart';
import 'package:whatsaap/info.dart';
import 'package:whatsaap/models/chat_contact.dart';
import 'package:whatsaap/models/message.dart';
import 'package:whatsaap/models/user_model.dart';

final chatRepositoryProvider = Provider((ref) => ChatRepository(
    firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance));

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  ChatRepository({
    required this.firestore,
    required this.auth,
  });

  Stream<List<ChatContacts>> getChatContactContacts() {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .snapshots()
        .asyncMap((event) async {
      List<ChatContacts> contacts = [];
      for (var document in event.docs) {
        var chatContact = ChatContacts.fromMap(document.data());
        var userData = await firestore
            .collection('users')
            .doc(chatContact.contactId)
            .get();
        var user = UserModel.fromMap(userData.data()!);
        contacts.add(ChatContacts(
            name: user.name,
            profilePic: user.profilePic,
            contactId: chatContact.contactId,
            timeSent: chatContact.timeSent,
            lastMessage: chatContact.lastMessage));
      }
      return contacts;
    });
  }

  Stream<List<Message>> getChatStream(String recieverUserId) {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(recieverUserId)
        .collection('messages')
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
      List<Message> messages = [];
      for (var document in event.docs) {
        messages.add(Message.fromMap(document.data()));
      }
      return messages;
    });
  }

  void _saveDataToContactsSubCollection(
    UserModel senderUserData,
    UserModel recieverUserData,
    String text,
    DateTime timeSent,
    String recieverUserId,
  ) async {
    var recieverChatContact = ChatContacts(
        name: senderUserData.name,
        profilePic: senderUserData.profilePic,
        contactId: senderUserData.uid,
        timeSent: timeSent.toString(),
        lastMessage: text);
    log("saveDataToContactsSubCollection run");
    await firestore
        .collection('users')
        .doc(recieverUserId)
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .set(recieverChatContact.toMap());

    var senderChatContact = ChatContacts(
        name: recieverUserData.name,
        profilePic: recieverUserData.profilePic,
        contactId: recieverUserData.uid,
        timeSent: timeSent.toString(),
        lastMessage: text);

    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(recieverUserId)
        .set(senderChatContact.toMap());
  }

  _saveMessageToMessageSubCollection({
    required String recieverUserId,
    required String text,
    required DateTime timeSent,
    required String messageId,
    required String username,
    required reciverUsername,
    required MessageEnum messageType,
  }) async {
    final message = Message(
      senderId: auth.currentUser!.uid,
      recieverId: recieverUserId,
      text: text,
      type: messageType,
      timeSent: timeSent,
      messageId: messageId,
      isSeen: false,
    );
    log("_saveMessageToMessageSubCollection run");

    //      users  -->Sender id -->reciever id --> chat_collecetion--->chat_id  ---> message_collection-->message_id--->all messages
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(recieverUserId)
        .collection('messages')
        .doc(messageId)
        .set(message.toMap());

    //  long form : users  -->  reciever_id -->  sender_id --> chat_collecetion--->  chat_id  ---> message_collection-->message_id--->all messages
    //  short form on firebase:   user -->reciever id --> sender id -->messages -->message id -->messagess
    await firestore
        .collection('users')
        .doc(recieverUserId)
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .collection('messages')
        .doc(messageId)
        .set(message.toMap());
  }

  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String recieverUserId,
    required UserModel senderUser,
  }) async {
    try {
      // log("isShowSendButton button is running in bottom_chat_filed class repositoruy;r");
      var timeSent = DateTime.now();
      UserModel reciverUserData;

      var userDataMap =
          await firestore.collection("users").doc(recieverUserId).get();
      reciverUserData = UserModel.fromMap(userDataMap.data()!);

      var messageId = const Uuid().v1();

      _saveDataToContactsSubCollection(
          senderUser, reciverUserData, text, timeSent, recieverUserId);

      _saveMessageToMessageSubCollection(
          recieverUserId: recieverUserId,
          text: text,
          timeSent: timeSent,
          messageId: messageId,
          username: senderUser.name,
          reciverUsername: reciverUserData.name,
          messageType: MessageEnum.text);
    } catch (e) {
      log("error $e");
      showSnackBar(context: context, content: e.toString());
    }
  }
}
