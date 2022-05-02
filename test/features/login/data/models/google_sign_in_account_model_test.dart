import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:ofertas/features/login/data/models/google_sign_in_account_model.dart';
import '../../../../fixtures/google_sign_in_fixture_reader.dart';

void main() {
  GoogleSignInAccountModel userData = const GoogleSignInAccountModel(
    uid: 'uid',
    displayName: 'name',
    email: 'email@twobrains.com.ar',
    photoUrl: 'https:\\photoUrl.com',
  );
  testWidgets(
      'google sign in account model should be a subclass of User entity',
      (tester) async {
    //assert
    expect(userData, isA<GoogleSignInAccountModel>());
  });

  group('from JSON Converter', () {
    test('Should convert an http response into a model object', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('google_sign_in_fixture.json'));
      //act
      final result = GoogleSignInAccountModel.fromJson(jsonMap);
      //assert
      expect(result, userData);
    });
  });

  group('to JSON Converter', () {
    test('Should convert a google sign in model into a JSON object', () async {
      //act
      final result = userData.toJson();
      final expectedMap = {
        "uid": "uid",
        "displayName": "name",
        "email": "email@twobrains.com.ar",
        "photoUrl": "https:\\photoUrl.com"
      };
      //assert
      expect(result, expectedMap);
    });
  });
}
