// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appointment/app/presentation/controller/app_cubit.dart';
import 'package:appointment/app/presentation/controller/app_state.dart';
import 'package:appointment/app/presentation/widgets/bottom_navbar_item.dart';
import 'package:appointment/app/presentation/widgets/bottom_navbar_search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:appointment/core/helpers/spacing.dart';
import 'package:ionicons/ionicons.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final appCubit = AppCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              child: appCubit.screens[appCubit.currentIndex],
            ),
          ),
          floatingActionButton: SizedBox(
            height: 72.h,
            width: 72.h,
            child: BottomNavbarSearchButton(
              onPressed: () {
                appCubit.changeCurrentIndex(2);
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            height: 70.h,
            surfaceTintColor: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10.h,
            child: SizedBox(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BottomNavbarItem(
                        icon: appCubit.currentIndex == 0
                            ? Ionicons.home
                            : Ionicons.home_outline,
                        onPressed: () {
                          appCubit.changeCurrentIndex(0);
                        },
                        isSelected: appCubit.currentIndex == 0 ? true : false,
                      ),
                      horizontalSpace(25),
                      BottomNavbarItem(
                        icon: appCubit.currentIndex == 1
                            ? Ionicons.chatbox_ellipses
                            : Ionicons.chatbox_ellipses_outline,
                        onPressed: () {
                          appCubit.changeCurrentIndex(1);
                        },
                        isSelected: appCubit.currentIndex == 1 ? true : false,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BottomNavbarItem(
                        icon: appCubit.currentIndex == 3
                            ? Ionicons.calendar
                            : Ionicons.calendar_outline,
                        onPressed: () {
                          appCubit.changeCurrentIndex(3);
                        },
                        isSelected: appCubit.currentIndex == 3 ? true : false,
                      ),
                      horizontalSpace(25),
                      BottomNavbarItem(
                        icon: appCubit.currentIndex == 4
                            ? Ionicons.person
                            : Ionicons.person_outline,
                        onPressed: () {
                          appCubit.changeCurrentIndex(4);
                        },
                        isSelected: appCubit.currentIndex == 4 ? true : false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
