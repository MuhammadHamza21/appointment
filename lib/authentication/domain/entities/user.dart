// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String message;
  final Data data;
  final bool status;
  final int code;
  const User({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });
  @override
  List<Object?> get props => [
        message,
        data,
        status,
        code,
      ];
}

class Data extends Equatable {
  final String token;
  final String username;
  const Data({
    required this.token,
    required this.username,
  });

  @override
  List<Object?> get props => [token, username];
}
