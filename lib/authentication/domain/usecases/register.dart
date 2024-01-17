// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:appointment/authentication/domain/entities/user.dart';
import 'package:appointment/authentication/domain/repository/base_auth_repository.dart';
import 'package:appointment/core/error/failures.dart';
import 'package:appointment/core/usecase/base_usecase.dart';

class RegisterUsecase extends BaseUsecase<User, RegisterParams> {
  final BaseAuthRepository baseAuthRepository;
  RegisterUsecase({
    required this.baseAuthRepository,
  });
  @override
  Future<Either<Failure, User>> call(RegisterParams parameters) async {
    return await baseAuthRepository.register(parameters);
  }
}

class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String mobileNumber;
  final int gender;
  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.gender,
  });

  @override
  List<Object?> get props => [name, email, password, mobileNumber, gender];
}
