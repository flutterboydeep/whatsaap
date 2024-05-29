import 'package:country_picker/country_picker.dart';

import 'package:flutter/material.dart';

import 'package:whatsaap/helper/custom_button.dart';
import 'package:whatsaap/helper/text_helper.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/logins-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneCtrl = TextEditingController();
  Country? country;
  @override
  void dispose() {
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Enter your phone number"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextHelper(
                  text: "WhatsApp will need to verify your phone number.",
                  fontSize: 15,
                ),
                SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      pickCountry(context);
                    },
                    child: TextHelper(
                      text: "Pick country",
                      color: Colors.blue.shade700,
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    // if (country != null)
                    TextHelper(
                      text: country == null ? '+91' : '+${country!.phoneCode}',
                      fontSize: 20,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: phoneCtrl,
                        decoration: InputDecoration(hintText: "Phone number"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                    height: 50,
                    width: 100,
                    child: CustomButton(
                      onPressed: () {},
                      text: "Next",
                      textcolor: Colors.black,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void pickCountry(context) {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }
}
