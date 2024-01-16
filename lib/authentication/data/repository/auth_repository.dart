// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appointment/core/constants/app_constants.dart';
import 'package:appointment/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import 'package:appointment/authentication/data/data_source/remote_data_source.dart';
import 'package:appointment/authentication/domain/entities/user.dart';
import 'package:appointment/authentication/domain/repository/base_auth_repository.dart';
import 'package:appointment/authentication/domain/usecases/login.dart';
import 'package:appointment/core/error/failures.dart';
import 'package:appointment/core/networking/network_info.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseNetworkInfo baseNetworkInfo;
  final BaseAuthRemoteDatasource baseAuthRemoteDatasource;
  AuthRepository({
    required this.baseNetworkInfo,
    required this.baseAuthRemoteDatasource,
  });
  @override
  Future<Either<Failure, User>> login(LoginParams params) async {
    if (await baseNetworkInfo.isConnected) {
      try {
        var result = await baseAuthRemoteDatasource.login(params);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(
          ServerFailure(message: failure.error.message),
        );
      }
    } else {
      return const Left(
        OfflineFailure(message: AppConstants.offlineErrorMessage),
      );
    }
  }
}
