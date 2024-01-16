// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ErrorEntity extends Equatable {
  final String message;
  final int code;
  final bool status;
  const ErrorEntity({
    required this.message,
    required this.code,
    required this.status,
  });
  @override
  List<Object?> get props => [message, code, status];
}

class ErrorModel extends ErrorEntity {
  const ErrorModel({
    required super.message,
    required super.code,
    required super.status,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        message: json['message'],
        code: json['code'],
        status: json['status'],
      );
}
