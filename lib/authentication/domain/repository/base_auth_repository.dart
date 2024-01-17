import 'package:appointment/authentication/domain/entities/user.dart';
import 'package:appointment/authentication/domain/usecases/login.dart';
import 'package:appointment/authentication/domain/usecases/register.dart';
import 'package:appointment/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, User>> login(LoginParams params);
  Future<Either<Failure, User>> register(RegisterParams params);
}
