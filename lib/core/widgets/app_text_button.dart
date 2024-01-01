// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:appointment/core/themes/colors.dart';
import 'package:appointment/core/themes/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderRadius = 16,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    this.textStyle,
  });
  final String title;
  final Function() onPressed;
  final double borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(backgroundColor ?? AppColors.primaryColor),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 52)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.w ?? 14.h,
          ),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(
            buttonWidth ?? double.infinity,
            buttonHeight ?? 50.h,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: textStyle ?? TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
