import 'package:flutter/material.dart';

import 'package:whatsaap/features/auth/auth_screens/login_screen.dart';
import 'package:whatsaap/helper/custom_button.dart';

import 'package:whatsaap/widgets/commonWidget/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: backgroundColor,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to WhatsApp",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 500,
                    maxWidth: 500,
                  ),
                  child: Image(
                    // height: 320,
                    // width: 320,
                    image: AssetImage("lib/assets/images/bg.png"),
                    color: tabColor,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Read our Privacy Policy. Tap \"Agree and continue\" to accept the  Terms of Service.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: 80, maxWidth: 800, minWidth: 500),
                        child: CustomButton(
                          text: "AGREE AND CONTINUE",
                          textcolor: Colors.black,
                          textfontSize: 16,
                          onPressed: () {
                            navigateToLoginScreen(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => LoginScreen()));
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
