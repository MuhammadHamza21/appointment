import 'package:appointment/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle font13GreyRegular = TextStyle(
    fontSize: 13.sp,
    color: AppColors.greyColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font16White500Wight = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}
