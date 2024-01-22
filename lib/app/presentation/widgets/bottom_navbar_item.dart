import 'package:appointment/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavbarItem extends StatelessWidget {
  const BottomNavbarItem({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.isSelected,
  });
  final Function() onPressed;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40.w,
      onPressed: onPressed,
      child: Icon(
        icon,
        color: isSelected ? AppColors.primaryColor : Colors.black,
        size: 30,
      ),
    );
  }
}
