import 'package:appointment/app/domain/entities/speciality.dart';
import 'package:appointment/app/presentation/controller/app_state.dart';
import 'package:appointment/app/presentation/screens/home_screen.dart';
import 'package:appointment/app/presentation/screens/messages_screen.dart';
import 'package:appointment/app/presentation/screens/profile_screen.dart';
import 'package:appointment/app/presentation/screens/schedules_screen.dart';
import 'package:appointment/app/presentation/screens/search_screen.dart';
import 'package:appointment/core/constants/constant_variables.dart';
import 'package:appointment/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(BuildContext context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const MessagesScreen(),
    const SearchScreen(),
    const SchedulesScreen(),
    const ProfileScreen(),
  ];
  List<Speciality> specialityList = kSpecialityList;
  void changeCurrentIndex(int index) {
    emit(state.copyWith(changingCurrentIndex: RequestState.loading));
    currentIndex = index;
    emit(state.copyWith(changingCurrentIndex: RequestState.loaded));
  }
}
