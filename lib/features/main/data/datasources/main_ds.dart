import 'package:flutter_web_portfolio/core/const/firebase_constants.dart';
import 'package:flutter_web_portfolio/core/services/firestore_service.dart';
import 'package:flutter_web_portfolio/features/main/data/dtos/profile_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainDs {
  final FirestoreService _firestoreService;

  MainDs(this._firestoreService);

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
}
