import 'package:appointment/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUsecase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object?> get props => [];
}
