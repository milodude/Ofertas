import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ofertas/features/login/data/data_sources/google_sign_in_account_remote_data_source.dart';

import 'google_sign_in_account_remote_data_source_test.mocks.dart';

@GenerateMocks([GoogleSignIn, GoogleAuthProvider, GoogleSignInAuthentication])
void main() {
  // MockGoogleSignInAccount mockGoogleSignInAccount = MockGoogleSignInAccount();
  MockGoogleSignInAuthentication mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();

  MockGoogleSignIn mockGoogleSignIn = MockGoogleSignIn();

  GoogleSignInAccountRemoteDataSourceImpl remoteDataSource =
      GoogleSignInAccountRemoteDataSourceImpl(googleSignIn: mockGoogleSignIn);

  group('Sign In to google', () {
    testWidgets('Should sign in to google and return a userData object',
        (tester) async {
      //Arrange
      when(mockGoogleSignIn.signIn())
          .thenAnswer((_) =>
        Future.value(null));
      //Act

      //Assert
    });
  });
}
