// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appointment/app/presentation/controller/app_cubit.dart';
import 'package:appointment/app/presentation/controller/app_state.dart';
import 'package:appointment/app/presentation/widgets/app_notification_button.dart';
import 'package:appointment/app/presentation/widgets/book_and_find_nearby_doctors_widget.dart';
import 'package:appointment/app/presentation/widgets/speciality_widget.dart';
import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/themes/colors.dart';
import 'package:appointment/core/themes/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:appointment/app/presentation/widgets/greating_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final appCubit = AppCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GreatingWidget(
                    name: "Mohamed",
                  ),
                  AppNotificationsButton(),
                ],
              ),
              const BookAndFindNearbyDoctorsWidget(),
              verticalSpace(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Doctor Speciality",
                    style: TextStyles.font18BlackSemibold,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "See All",
                      style: TextStyles.font13BlueRegular,
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ),
                ],
              ),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SpecialityWidget(
                    speciality: appCubit.specialityList[0],
                  ),
                  SpecialityWidget(
                    speciality: appCubit.specialityList[1],
                  ),
                  SpecialityWidget(
                    speciality: appCubit.specialityList[2],
                  ),
                  SpecialityWidget(
                    speciality: appCubit.specialityList[3],
                  ),
                ],
              ),
              verticalSpace(23),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation Doctor",
                    style: TextStyles.font18BlackSemibold,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "See All",
                      style: TextStyles.font13BlueRegular,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
