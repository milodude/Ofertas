import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ofertas/core/constants/constants.dart';
import 'package:ofertas/features/login/data/data_sources/google_sign_in_account_local_data_source.dart';
import 'package:ofertas/features/login/data/models/google_sign_in_account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/google_sign_in_fixture_reader.dart';
import 'google_sign_in_account_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  MockSharedPreferences mockSharedPreferences = MockSharedPreferences();
  GoogleSignInAccountLocalDataSourceImpl localDataSourceImpl =
      GoogleSignInAccountLocalDataSourceImpl(
          sharedPreferences: mockSharedPreferences);

  group('Local login data using sharedPreferences', () {
    final tGoogleSignInData = GoogleSignInAccountModel.fromJson(
        jsonDecode(fixture('google_sign_in_fixture.json')));
    testWidgets('should return sign in account local data source',
        (tester) async {
      //Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(
          (fixture('google_sign_in_fixture.json')));
      //Act
      final result = await localDataSourceImpl.getGoogleAccount();
      //Assert
      verify(mockSharedPreferences.getString(googleSignInData));
      expect(result, equals(tGoogleSignInData.toUserData()));
    });

    //TODO: crear test para setear el valor en shared preferences
  });
}
