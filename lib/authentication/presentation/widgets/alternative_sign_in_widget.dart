import 'package:appointment/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlternativeSignInWidget extends StatelessWidget {
  const AlternativeSignInWidget({
    super.key,
    required this.imageSrc,
    required this.onPressed,
  });
  final String imageSrc;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 46.h,
        width: 46.w,
        decoration: const BoxDecoration(
          color: AppColors.lighterGrey,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          imageSrc,
        ),
      ),
    );
  }
}
