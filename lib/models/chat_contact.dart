import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatContacts {
  final String name;
  final String profilePic;
  final String contactId;
  final String timeSent;
  final String lastMessage;
  ChatContacts({
    required this.name,
    required this.profilePic,
    required this.contactId,
    required this.timeSent,
    required this.lastMessage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'contactId': contactId,
      'timeSent': timeSent,
      'lastMessage': lastMessage,
    };
  }

  factory ChatContacts.fromMap(Map<String, dynamic> map) {
    return ChatContacts(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      contactId: map['contactId'] as String,
      timeSent: map['timeSent'] as String,
      lastMessage: map['lastMessage'] as String,
    );
  }
}
