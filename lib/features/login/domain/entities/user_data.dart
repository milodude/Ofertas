import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String uid;
  final String? displayName;
  final String? email;
  final String? photoUrl;

  const UserData(
      {required this.uid,
      required this.displayName,
      required this.email,
      required this.photoUrl})
      : super();

  @override
  List<Object?> get props => [uid, displayName, email, photoUrl];

  
}
