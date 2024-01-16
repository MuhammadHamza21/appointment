import 'package:appointment/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.message,
    required super.data,
    required super.status,
    required super.code,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json['message'] ?? "",
        data: DataModel.fromJson(json['data']),
        code: json['code'] ?? 0,
        status: json['status'] ?? false,
      );
}

class DataModel extends Data {
  const DataModel({required super.token, required super.username});
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        token: json['token'] ?? "",
        username: json['username'] ?? "",
      );
}
