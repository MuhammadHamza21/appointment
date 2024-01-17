import 'package:appointment/core/themes/colors.dart';
import 'package:appointment/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInWithWidget extends StatelessWidget {
  const SignInWithWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.moreMoreLightGreyGrey,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            "Or sign in with",
            style: TextStyles.font13DarkerGreyRegular,
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.moreMoreLightGreyGrey,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
