import 'package:appointment/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class AppNotificationsButton extends StatelessWidget {
  const AppNotificationsButton({
    super.key,
    this.newNotifications = false,
  });
  final bool newNotifications;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 46.h,
        width: 46.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lighterGrey,
        ),
        child: Center(
          child: Badge(
            label: Container(
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFF4C5E),
              ),
            ),
            backgroundColor: AppColors.lighterGrey.withOpacity(0),
            isLabelVisible: newNotifications,
            child: const Icon(
              Ionicons.notifications_outline,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
