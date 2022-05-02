import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:ofertas/core/platform/network_info.dart';
import 'package:ofertas/features/login/data/data_sources/google_sign_in_account_local_data_source.dart';
import 'package:ofertas/features/login/data/data_sources/google_sign_in_account_remote_data_source.dart';
import 'package:ofertas/features/login/domain/entities/user_data.dart';
import 'package:ofertas/features/login/domain/repositories/user_repository.dart';

import '../../../../core/error/failure.dart';

class UserRepositoryImpl extends ChangeNotifier implements IUserRepository {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // GoogleSignInAccount? _user;

  final GoogleSignInAccountRemoteDataSource remoteDataSource;
  final GoogleSignInAccountLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  // GoogleSignInAccount get user => _user!;


  @override
  Future<Either<Failure, UserData>> googleLogIn() async {

    networkInfo.isconnected();
    var _userData = await remoteDataSource.googleLogIn();
    localDataSource.cacheGoogleAccount(_userData);
    return Right(_userData);
    // try {
    //   GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
    //   if (googleAccount == null) return;
    //   _user = googleAccount;

    //   final googleAuth = await googleAccount.authentication;
    //   final credential = GoogleAuthProvider.credential(
    //       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    //   await FirebaseAuth.instance.signInWithCredential(credential);
    //   notifyListeners();
    // } catch (e) {
    //   // print(e.toString());
    // }
  }

  Future<Either<Failure, void>?> googleLogOut() async {
    return null;
    // await _googleSignIn.disconnect();
    // FirebaseAuth.instance.signOut();
  }
}
