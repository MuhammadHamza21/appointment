// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appointment/app/presentation/controller/app_cubit.dart';
import 'package:appointment/authentication/presentation/controller/auth_cubit.dart';
import 'package:appointment/core/di/service_locator.dart';
import 'package:appointment/core/routing/routes.dart';
import 'package:appointment/core/themes/colors.dart';
import 'package:flutter/material.dart';

import 'package:appointment/core/routing/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<AuthCubit>()),
          BlocProvider(create: (context) => sl<AppCubit>()),
        ],
        child: MaterialApp(
          title: 'DocApp',
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
