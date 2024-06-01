import 'package:flutter/material.dart';
import 'package:whatsaap/features/auth/auth_screens/login_screen.dart';
import 'package:whatsaap/features/auth/auth_screens/otp_screen.dart';
import 'package:whatsaap/features/auth/auth_screens/user_information_screen.dart';
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
    default:
      return MaterialPageRoute(builder: (context) => ErrorScreen());
  }
}
