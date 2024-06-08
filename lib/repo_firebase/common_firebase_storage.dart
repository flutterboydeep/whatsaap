import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commonFirebaseStroageRepositoryProvider = Provider(
  (ref) => CommonFirebaseStroageRepository(
      firebaseStorage: FirebaseStorage.instance),
);

class CommonFirebaseStroageRepository {
  final FirebaseStorage firebaseStorage;
  CommonFirebaseStroageRepository({
    required this.firebaseStorage,
  });

  Future<String> storeFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
