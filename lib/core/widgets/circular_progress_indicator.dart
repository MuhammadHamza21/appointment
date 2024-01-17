import 'package:appointment/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  const CircularProgressIndicatorWidget({
    super.key,
    this.color = AppColors.primaryColor,
    this.verticalPadding,
  });

  final Color color;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding != null ? verticalPadding!.h : 8.h),
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}
