import 'package:flutter/material.dart';
import 'package:whatsaap/features/auth/auth_screens/login_screen.dart';
import 'package:whatsaap/features/auth/auth_screens/otp_screen.dart';
import 'package:whatsaap/features/auth/auth_screens/user_information_screen.dart';
import 'package:whatsaap/features/select_contacts/screen/select_contacts_screen.dart';

import 'package:whatsaap/widgets/app/chatpage_str_mobile.dart';

import 'package:whatsaap/widgets/error_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => LoginScreen());

    case OtpScreen.routeName:
      final verificationId = settings.arguments as String;

      return MaterialPageRoute(
          builder: (context) => OtpScreen(
                verificationId: verificationId,
              ));
    case UserInformationScreen.routeName:
      return MaterialPageRoute(builder: (context) => UserInformationScreen());
    case SelectContactScreen.routeName:
      return MaterialPageRoute(builder: (context) => SelectContactScreen());
    case ChatPageStructureMobile.routeName:
      final argument = settings.arguments as Map<String, dynamic>;
      final name = argument['name'];
      final uid = argument['uid'];
      return MaterialPageRoute(builder: (context) => ChatPageStructureMobile());
    default:
      return MaterialPageRoute(
          builder: (context) => ErrorScreen(
                error: "This page does't",
              ));
  }
}
