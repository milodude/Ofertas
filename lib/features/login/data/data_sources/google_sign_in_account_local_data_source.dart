import 'dart:convert';

import 'package:ofertas/core/constants/constants.dart';
import 'package:ofertas/core/error/exceptions.dart';
import 'package:ofertas/features/login/data/models/google_sign_in_account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ofertas/features/login/domain/entities/user_data.dart';

//Esto habria que ver si sirve o no.
abstract class GoogleSignInAccountLocalDataSource {
  ///Gets the last used account from Google
  Future<UserData> getGoogleAccount();

  ///Sets the cache with the used google account the user selected to log in into the app with.
  Future<void> cacheGoogleAccount(UserData modelToCache);
}

class GoogleSignInAccountLocalDataSourceImpl
    implements GoogleSignInAccountLocalDataSource {
  final SharedPreferences sharedPreferences;
  GoogleSignInAccountLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheGoogleAccount(UserData modelToCache){
    return sharedPreferences.setString(googleSignInData, jsonEncode(modelToCache.toJson()));
  }

  @override
  Future<UserData> getGoogleAccount() {
    final account = sharedPreferences.getString(googleSignInData);
    if (account != null) {
      return Future.value(
          GoogleSignInAccountModel.fromJson(json.decode(account))
              .toUserData());
    }else{
      throw CachedException('No value in sharedPreferences found for userData');
    }
  }
}
