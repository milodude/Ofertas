import 'package:ofertas/features/login/domain/entities/user_data.dart';

//Esto habria que ver si sirve o no.
abstract class GoogleSignInAccountLocalDataSource{
  ///Gets the last used account from Google
  Future<UserData> getGoogleAccount();
  ///Sets the cache with the used google account the user selected to log in into the app with.
  Future<void> cacheGoogleAccount(UserData modelToCache);
}