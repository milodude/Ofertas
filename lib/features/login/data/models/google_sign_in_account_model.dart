
import '../../domain/entities/user_data.dart';

class GoogleSignInAccountModel extends UserData {
  const GoogleSignInAccountModel(
      {required String uid,
      required String? displayName,
      required String? email,
      required String? photoUrl})
      : super(
          uid: uid,
          displayName: displayName,
          email: email,
          photoUrl: photoUrl,
        );

  factory GoogleSignInAccountModel.fromJson(Map<String, dynamic> model) {
    return GoogleSignInAccountModel(
      uid: model['uid'],
      displayName: model['displayName'],
      email: model['email'],
      photoUrl: model['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl
    };
  }
}
