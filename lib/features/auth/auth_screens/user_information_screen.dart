import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/features/auth/controller/auth_controller.dart';
import 'package:whatsaap/helper/utils/utils.dart';

import 'package:whatsaap/widgets/commonWidget/colors.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String routeName = '/user-information';
  const UserInformationScreen({super.key});

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  TextEditingController nameCtrl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameCtrl.dispose();
  }

  File? image;
  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    String name = nameCtrl.text.trim().toLowerCase();
    if (name.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .saveUserInfoToFirebase(context, name, image);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  image == null
                      ? CircleAvatar(
                          radius: 80,
                          // backgroundColor: Colors.grey,
                          // backgroundImage: NetworkImage(
                          //     "https://media.istockphoto.com/id/517998264/vector/male-user-icon.jpg?s=612x612&w=0&k=20&c=4RMhqIXcJMcFkRJPq6K8h7ozuUoZhPwKniEke6KYa_k="),
                          //  backgroundImage: Image.network(
                          backgroundImage:
                              AssetImage("lib/assets/images/NoPerson.jpg"),
                          // : Image.asset("lib/assets/images/NoPerson.jpg"),
                        )
                      : CircleAvatar(
                          radius: 80,
                          backgroundImage: FileImage(image!),
                        ),
                  Positioned(
                    bottom: 10,
                    right: 6,
                    child: Container(
                      // height: 40,
                      // width: 40,
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: InkWell(
                          onTap: () {
                            selectImage();
                          },
                          child: Icon(
                            Icons.add_a_photo_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: nameCtrl,
                        decoration: InputDecoration(
                          hintText: "Enter your name",
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        storeUserData();
                      },
                      icon: Icon(Icons.done))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
