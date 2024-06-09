import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/features/auth/repository/auth_repository.dart';
import 'package:whatsaap/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepo, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getCurrentUserData();
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;
  AuthController({required this.authRepository, required this.ref});

  Future<UserModel?> getCurrentUserData() async {
    UserModel? user = await authRepository.getCurrentUserData();
    return user;
  }

  void signInWithPhone(context, String phoneNumber) {
    authRepository.signInWithPhone(
      context,
      phoneNumber,
    );
  }

  void verifyOtp(context, String verifcationId, String userOtp) {
    authRepository.verifyOtp(
      context: context,
      verificationId: verifcationId,
      userOTP: userOtp,
    );
  }

  void saveUserInfoToFirebase(
    BuildContext context,
    String name,
    File? profilePic,
  ) {
    authRepository.saveUserInformationToFirebase(
        name: name, profilePic: profilePic, ref: ref, context: context);
  }
}
