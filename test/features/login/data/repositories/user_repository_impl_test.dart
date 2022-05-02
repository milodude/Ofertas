import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ofertas/core/constants/constants.dart';
import 'package:ofertas/core/error/exceptions.dart';
import 'package:ofertas/core/error/failure.dart';
import 'package:ofertas/core/network/network_info.dart';
import 'package:ofertas/features/login/data/data_sources/google_sign_in_account_local_data_source.dart';
import 'package:ofertas/features/login/data/data_sources/google_sign_in_account_remote_data_source.dart';
import 'package:ofertas/features/login/data/repositories/user_repository_impl.dart';
import 'package:ofertas/features/login/domain/entities/user_data.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([
  NetworkInfo,
  GoogleSignInAccountRemoteDataSource,
  GoogleSignInAccountLocalDataSource
])
void main() {
  MockGoogleSignInAccountLocalDataSource mockLocalDataSource =
      MockGoogleSignInAccountLocalDataSource();
  MockGoogleSignInAccountRemoteDataSource mockRemoteDataSource =
      MockGoogleSignInAccountRemoteDataSource();
  MockNetworkInfo mockNetworkinfo = MockNetworkInfo();

  UserData tUser = const UserData(
      uid: 'uid',
      displayName: 'displayName',
      email: 'email',
      photoUrl: 'photoUrl');

  UserRepositoryImpl repositoryImplementation = UserRepositoryImpl(
    remoteDataSource: mockRemoteDataSource,
    localDataSource: mockLocalDataSource,
    networkInfo: mockNetworkinfo,
  );

  group('Network info gets you is Online', () {
    setUp(() {
      when(mockNetworkinfo.isConnected())
          .thenAnswer((_) async => Future.value(true));
      when(mockRemoteDataSource.googleLogIn())
          .thenAnswer((realInvocation) => Future.value(tUser));
    });
    testWidgets('Should return true if there is a connection available',
        (tester) async {
      //act
      await repositoryImplementation.googleLogIn();
      //assert
      //chequea que haya sido llamado
      verify(mockNetworkinfo.isConnected());
    });
  });

  group('Google Sign In', () {
    setUp(() {
      when(mockNetworkinfo.isConnected())
          .thenAnswer((_) async => Future.value(true));
      when(mockRemoteDataSource.googleLogIn())
          .thenAnswer((realInvocation) => Future.value(tUser));
    });
    test('Should sign in if credentials are ok', () async {
      //arrange
      //act
      var result = await repositoryImplementation.googleLogIn();
      //assert
      expect(result, equals(Right(tUser)));
    });

     test('Should return a failure if log in fails', () async {
      //arrange
      var exception = ServerException('Server not found');
       when(mockRemoteDataSource.googleLogIn())
          .thenThrow(exception);
      //act
      var result = await repositoryImplementation.googleLogIn();
      //assert
      expect(result, equals(const Left(ServerFailure(serverException))));
    });
  });
}
