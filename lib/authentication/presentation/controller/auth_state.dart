import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {}

class LoginOfflineState extends AuthState {}

class LoginSuccessState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterOfflineState extends AuthState {}

class RegisterErrorState extends AuthState {}

class CheckOtpCodeSuccessState extends AuthState {}

class CheckOtpCodeLoadingState extends AuthState {}

class CheckOtpCodeOfflineState extends AuthState {}

class CheckOtpCodeErrorState extends AuthState {}
