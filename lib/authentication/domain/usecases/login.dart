// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:appointment/authentication/domain/entities/user.dart';
import 'package:appointment/authentication/domain/repository/base_auth_repository.dart';
import 'package:appointment/core/error/failures.dart';
import 'package:appointment/core/usecase/base_usecase.dart';

class LoginUsecase extends BaseUsecase<User, LoginParams> {
  final BaseAuthRepository baseAuthRepository;
  LoginUsecase({
    required this.baseAuthRepository,
  });
  @override
  Future<Either<Failure, User>> call(LoginParams parameters) async {
    return await baseAuthRepository.login(parameters);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;
  const LoginParams({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password];
}
