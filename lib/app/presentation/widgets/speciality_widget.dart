// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:appointment/app/domain/entities/speciality.dart';
import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/themes/colors.dart';
import 'package:appointment/core/themes/styles.dart';

class SpecialityWidget extends StatelessWidget {
  const SpecialityWidget({
    super.key,
    required this.speciality,
    this.widgetWidth,
    this.containerHeight,
    this.containerWidth,
  });

  final Speciality speciality;
  final double? widgetWidth;
  final double? containerHeight;
  final double? containerWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetWidth ?? 80.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: containerHeight ?? 56.h,
            width: containerWidth ?? 56.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightBlue,
            ),
            child: Image.asset(speciality.image),
          ),
          verticalSpace(12),
          Text(
            speciality.name,
            style: TextStyles.font13BlackRegular,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
