import 'package:appointment/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class BottomNavbarSearchButton extends StatelessWidget {
  const BottomNavbarSearchButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27.92),
      ),
      elevation: 0,
      child: const Icon(
        Ionicons.search_outline,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
