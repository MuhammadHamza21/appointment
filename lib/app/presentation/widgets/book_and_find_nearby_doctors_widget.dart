import 'package:appointment/core/themes/colors.dart';
import 'package:appointment/core/themes/styles.dart';
import 'package:appointment/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAndFindNearbyDoctorsWidget extends StatelessWidget {
  const BookAndFindNearbyDoctorsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          height: 167.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 87.h,
                      width: 143.w,
                      child: Text(
                        "Book and schedule with nearest doctor",
                        style: TextStyles.font18WhiteMedium,
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(
                      height: 38.h,
                      width: 109.w,
                      child: AppTextButton(
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        borderRadius: 50,
                        title: "Find Nearby",
                        textStyle: TextStyles.font13BlueRegular,
                        verticalPadding: 0,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                "assets/images/nurse.png",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
