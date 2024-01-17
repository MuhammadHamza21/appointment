// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:appointment/authentication/domain/entities/user.dart';
import 'package:appointment/authentication/domain/usecases/register.dart';
import 'package:appointment/core/error/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:appointment/authentication/domain/usecases/login.dart';
import 'package:appointment/authentication/presentation/controller/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  AuthCubit(
    this._loginUsecase,
    this._registerUsecase,
  ) : super(AuthInitState());
  static AuthCubit get(BuildContext context) => BlocProvider.of(context);
  User? loginUser;
  String loginMessage = "";
  User? registerUser;
  String registerMessage = "";
  FutureOr<void> login(LoginParams params) async {
    emit(LoginLoadingState());
    var result = await _loginUsecase(params);
    result.fold(
      (l) {
        loginMessage = l.message;
        if (l is ServerFailure) {
          emit(LoginErrorState());
        } else if (l is OfflineFailure) {
          emit(LoginOfflineState());
        }
      },
      (r) {
        loginUser = r;
        emit(LoginSuccessState());
      },
    );
  }

  FutureOr<void> register(RegisterParams params) async {
    emit(RegisterLoadingState());
    var result = await _registerUsecase(params);
    result.fold(
      (l) {
        registerMessage = l.message;
        if (l is ServerFailure) {
          emit(RegisterErrorState());
        } else if (l is OfflineFailure) {
          emit(RegisterOfflineState());
        }
      },
      (r) {
        registerUser = r;
        emit(RegisterSuccessState());
      },
    );
  }
}
