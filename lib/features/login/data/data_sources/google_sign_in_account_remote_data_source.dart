import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/entities/user_data.dart';

abstract class GoogleSignInAccountRemoteDataSource{
  ///Calls GoogleSignIn and logs in into firebase.
  Future<UserData?> googleLogIn();
  ///Logs out from google and closes the connection from Firebase
  Future<void> googleLogOut();
}

class GoogleSignInAccountRemoteDataSourceImpl implements GoogleSignInAccountRemoteDataSource{
  final GoogleSignIn googleSignIn;

  GoogleSignInAccountRemoteDataSourceImpl({required this.googleSignIn});

  @override
  Future<UserData?> googleLogIn() async {
      try {
      GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
      if (googleAccount == null) return null;

      final googleAuth = await googleAccount.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      return _convertToUserData(googleAccount);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> googleLogOut() {
    // TODO: implement googleLogOut
    throw UnimplementedError();
  }

  UserData _convertToUserData(GoogleSignInAccount googleAccount) {
    return UserData(uid: googleAccount.id, displayName: googleAccount.displayName, email: googleAccount.email, photoUrl: googleAccount.photoUrl);
  }

}