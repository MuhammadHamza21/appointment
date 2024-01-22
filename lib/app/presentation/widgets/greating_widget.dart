import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/themes/styles.dart';
import 'package:flutter/material.dart';

class GreatingWidget extends StatelessWidget {
  const GreatingWidget({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, $name!",
          style: TextStyles.font18BlackBold,
        ),
        verticalSpace(2),
        Text(
          "How Are you Today?",
          style: TextStyles.font13GreyRegular,
        ),
      ],
    );
  }
}
