// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appointment/core/themes/colors.dart';
import 'package:appointment/core/themes/styles.dart';
import 'package:flutter/material.dart';

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({
    super.key,
    required this.onChanged,
    required this.groupValue,
  });
  final Function(int?) onChanged;
  final int groupValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            value: 0,
            groupValue: groupValue,
            onChanged: onChanged,
            title: Text(
              "Male",
              style: TextStyles.font14GreyRegular,
            ),
            fillColor: const MaterialStatePropertyAll(AppColors.primaryColor),
          ),
        ),
        Expanded(
          child: RadioListTile(
            value: 1,
            groupValue: groupValue,
            onChanged: onChanged,
            title: Text(
              "Female",
              style: TextStyles.font14GreyRegular,
            ),
            fillColor: const MaterialStatePropertyAll(AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
