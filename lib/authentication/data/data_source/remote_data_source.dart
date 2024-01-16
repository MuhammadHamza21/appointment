import 'package:appointment/authentication/data/models/user_model.dart';
import 'package:appointment/authentication/domain/usecases/login.dart';
import 'package:appointment/core/constants/api_constants.dart';
import 'package:appointment/core/error/exceptions.dart';
import 'package:appointment/core/error/model/error_model.dart';
import 'package:appointment/core/networking/dio_helper.dart';
import 'package:dio/dio.dart';

abstract class BaseAuthRemoteDatasource {
  Future<UserModel> login(LoginParams params);
}

class AuthRemoteDatasource extends BaseAuthRemoteDatasource {
  @override
  Future<UserModel> login(LoginParams params) async {
    try {
      var response = await DioHelper.postData(
        ApiConstants.login,
        data: {
          "email": params.email,
          "password": params.password,
        },
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(
          error: ErrorModel.fromJson(response.data),
        );
      }
    } on DioException catch (failure) {
      throw ServerException(
        error: ErrorModel.fromJson(failure.response!.data),
      );
    }
  }
}
