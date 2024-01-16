import 'package:appointment/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static void init() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio!.post(
      url,
      data: data,
      queryParameters: queryParams,
    );
  }

  static Future<Response> getData(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio!.get(
      url,
      data: data,
      queryParameters: queryParams,
    );
  }
}
