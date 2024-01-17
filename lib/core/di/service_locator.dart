import 'package:appointment/authentication/data/data_source/remote_data_source.dart';
import 'package:appointment/authentication/data/repository/auth_repository.dart';
import 'package:appointment/authentication/domain/repository/base_auth_repository.dart';
import 'package:appointment/authentication/domain/usecases/login.dart';
import 'package:appointment/authentication/domain/usecases/register.dart';
import 'package:appointment/authentication/presentation/controller/auth_cubit.dart';
import 'package:appointment/core/local/cache_helper.dart';
import 'package:appointment/core/networking/dio_helper.dart';
import 'package:appointment/core/networking/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future init() async {
    // Repositories
    sl.registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(
        baseAuthRemoteDatasource: sl(),
        baseNetworkInfo: sl(),
      ),
    );
    // Datasources
    sl.registerLazySingleton<BaseAuthRemoteDatasource>(
        () => AuthRemoteDatasource());
    // Usecases
    sl.registerLazySingleton(() => LoginUsecase(baseAuthRepository: sl()));
    sl.registerLazySingleton(() => RegisterUsecase(baseAuthRepository: sl()));
    // Bloc
    sl.registerFactory(() => AuthCubit(sl(), sl()));
    // external
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerLazySingleton<BaseNetworkInfo>(
        () => NetworkInfo(connectionChecker: sl()));
    DioHelper.init();
    await CacheHelper.init();
  }
}
