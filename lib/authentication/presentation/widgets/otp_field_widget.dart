// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'package:appointment/core/themes/colors.dart';
import 'package:appointment/core/themes/styles.dart';

class OtpFieldWidget extends StatelessWidget {
  const OtpFieldWidget({
    super.key,
    required this.controller,
    this.onCodeChanged,
    this.onCodeSubmitted,
  });
  final TextEditingController controller;
  final Function(String?)? onCodeChanged;
  final Function(String)? onCodeSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: PinFieldAutoFill(
        controller: controller,
        codeLength: 4,
        decoration: BoxLooseDecoration(
          textStyle: TextStyles.font14DarkBlueMedium.copyWith(fontSize: 18),
          strokeColorBuilder:
              const FixedColorBuilder(AppColors.moreMoreLightGreyEd),
          radius: const Radius.circular(16),
          gapSpace: 10.w,
          bgColorBuilder: const FixedColorBuilder(
            Color(0xFFFDFDFF),
          ),
          hintText: "____",
          hintTextStyle: TextStyles.font14DarkerGreyMedium,
        ),
        onCodeChanged: onCodeChanged,
        onCodeSubmitted: onCodeSubmitted,
      ),
    );
  }
}
