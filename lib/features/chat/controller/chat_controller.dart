// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/features/auth/controller/auth_controller.dart';

import 'package:whatsaap/features/chat/repositiory/chat_repo.dart';
import 'package:whatsaap/models/chat_contact.dart';
import 'package:whatsaap/models/message.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepositorys = ref.watch(chatRepositoryProvider);

  return ChatController(chatRepository: chatRepositorys, ref: ref);
});

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;
  ChatController({
    required this.chatRepository,
    required this.ref,
  });

  Stream<List<ChatContacts>> chatContacts() {
    return chatRepository.getChatContactContacts();
  }

  Stream<List<Message>> chatStream(String reciverUserId) {
    return chatRepository.getChatStream(reciverUserId);
  }

  void sendTextMessage(
      BuildContext context, String text, String recieverUserId) {
    ref.read(userDataAuthProvider).whenData(
          (value) => chatRepository.sendTextMessage(
              context: context,
              text: text,
              recieverUserId: recieverUserId,
              senderUser: value!),
        );
  }
}
