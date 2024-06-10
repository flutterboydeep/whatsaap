import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/features/auth/auth_screens/otp_screen.dart';
import 'package:whatsaap/features/auth/auth_screens/user_information_screen.dart';
import 'package:whatsaap/helper/utils/utils.dart';
import 'package:whatsaap/layoutScreens/mobile_screen_layout.dart';
import 'package:whatsaap/models/user_model.dart';
import 'package:whatsaap/repo_firebase/common_firebase_storage.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  Future<UserModel?> getCurrentUserData() async {
    var userData =
        await firestore.collection("users").doc(auth.currentUser?.uid).get();
    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return null;
  }

  void signInWithPhone(BuildContext context, String userphoneNumber) async {
    try {
      auth.verifyPhoneNumber(
          phoneNumber: userphoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await auth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (e) {
            throw Exception(e.message);
          },
          codeSent: (String verificationId, int? resendToken) async {
            Navigator.pushNamed(context, OtpScreen.routeName,
                arguments: verificationId);
          },
          codeAutoRetrievalTimeout: (String verifcationId) {});
    } on FirebaseAuthException catch (e) {
      log("Phone message error  is $e");
      showSnackBar(context: context, content: e.message!);
    }
  }

  verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOTP);
      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
          context, UserInformationScreen.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void saveUserInformationToFirebase({
    required String name,
    required File? profilePic,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl = "lib/assets/images/NoPerson.jpg";

      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStroageRepositoryProvider)
            .storeFileToFirebase("profilePic/$uid", profilePic);
      }
      var user = UserModel(
          name: name,
          uid: uid,
          profilePic: photoUrl,
          isOnline: true,
          phoneNumber: auth.currentUser!.phoneNumber.toString(),
          groupId: []);

      await firestore.collection("users").doc(uid).set(user.toMap());
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MobileScreenLayout()),
          (route) => false);

      // photoUrl = await ref
      //     .read(commonFirebaseStroageRepositoryProvider)
      //     .storeFileToFirebase('profile/$uid');
      // Strin
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
