import 'package:flutter_web_portfolio/core/const/firebase_constants.dart';
import 'package:flutter_web_portfolio/core/services/firestore_service.dart';
import 'package:flutter_web_portfolio/core/services/storage_service.dart';
import 'package:flutter_web_portfolio/features/main/data/dtos/profile_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainDs {

  MainDs(this._firestoreService, this._storageService);
  final FirestoreService _firestoreService;
  final StorageService _storageService;

  Future<ProfileDto> getProfile() async {
    final res = await _firestoreService.getDocument(
      collection: FirebaseConstants.profileCollection,
      docId: FirebaseConstants.profileDocId,
    );

    if (res != null) {
      return ProfileDto.fromJson(res);
    } else {
      throw Exception('Profile document not found');
    }
  }

  Future<String> getCvDownloadPath(String path) async {
    final url = await _storageService.getDownloadUrl(path: path);

    if (url != null) {
      return url;
    } else {
      throw Exception('CV download URL not found for path: $path');
    }
  }
}
