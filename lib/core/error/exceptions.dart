// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appointment/core/error/model/error_model.dart';

class ServerException implements Exception {
  final ErrorEntity error;
  ServerException({required this.error});
}

class LocalException implements Exception {
  final String message;
  LocalException({
    required this.message,
  });
}
