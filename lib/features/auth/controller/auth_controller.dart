import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepo);
});

class AuthController {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

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
}
