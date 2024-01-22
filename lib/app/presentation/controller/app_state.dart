// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:appointment/core/utils/enums.dart';

class AppState extends Equatable {
  final RequestState changingCurrentIndex;
  const AppState({
    this.changingCurrentIndex = RequestState.initial,
  });
  @override
  List<Object?> get props => [
        changingCurrentIndex,
      ];

  AppState copyWith({
    RequestState? changingCurrentIndex,
  }) =>
      AppState(
        changingCurrentIndex: changingCurrentIndex ?? this.changingCurrentIndex,
      );
}

class AppInitialState extends AppState {}
