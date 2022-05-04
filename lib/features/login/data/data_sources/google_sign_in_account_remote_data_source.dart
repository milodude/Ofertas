import '../../domain/entities/user_data.dart';

abstract class GoogleSignInAccountRemoteDataSource{
  ///Calls GoogleSignIn and logs in into firebase.
  Future<UserData> googleLogIn();
  ///Logs out from google and closes the connection from Firebase
  Future<void> googleLogOut();
}

//TODO: Implement GoogleSignInAccountRemoteDataSource