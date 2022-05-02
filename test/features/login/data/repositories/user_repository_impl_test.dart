import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ofertas/core/platform/network_info.dart';
import 'package:ofertas/features/login/data/data_sources/google_sign_in_account_local_data_source.dart';
import 'package:ofertas/features/login/data/data_sources/google_sign_in_account_remote_data_source.dart';
import 'package:ofertas/features/login/data/repositories/user_repository_impl.dart';
import 'package:ofertas/features/login/domain/entities/user_data.dart';

class MockGoogleSignInAccountLocalDataSource extends Mock
    implements GoogleSignInAccountLocalDataSource {}

class MockGoogleSignInAccountRemoteDataSource extends Mock
    implements GoogleSignInAccountRemoteDataSource {}

class MockNetworkinfo extends Mock implements NetworkInfo {}

void main() {
  MockGoogleSignInAccountLocalDataSource mockLocalDataSource =
      MockGoogleSignInAccountLocalDataSource();
  MockGoogleSignInAccountRemoteDataSource mockRemoteDataSource =
      MockGoogleSignInAccountRemoteDataSource();
  MockNetworkinfo mockNetworkinfo = MockNetworkinfo();

  UserData tUser = const UserData(uid: 'uid', displayName: 'displayName', email: 'email', photoUrl: 'photoUrl');

  UserRepositoryImpl repositoryImplementation = UserRepositoryImpl(
    remoteDataSource: mockRemoteDataSource,
    localDataSource: mockLocalDataSource,
    networkInfo: mockNetworkinfo,
  );
  // setUp(() {});

  group('Network info gets you is Online', () {
    testWidgets('Should return true if there is a connection available',
        (tester) async {
      //arrange
      when(mockNetworkinfo.isconnected())
          .thenAnswer((_) async => Future.value(true));
      //act
      await repositoryImplementation.googleLogIn();
      //assert
      //chequea que haya sido llamado
      verify(mockNetworkinfo.isconnected());
    });
  });

  group('Google Sign In', () {
    setUp((){
       when(mockNetworkinfo.isconnected()).thenAnswer((_) async => Future.value(true));
    });
    test('Should sign in if credentials are ok', () async{
      //arrange
      when(mockRemoteDataSource.googleLogIn()).thenAnswer((realInvocation) => Future.value(tUser));
      //act
      var result = await repositoryImplementation.googleLogIn();
      //assert
      expect(result, equals(Right(tUser)));
    });
  });


}
