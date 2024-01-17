// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:appointment/core/themes/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({
    super.key,
    required this.title,
    required this.signInOut,
    required this.onTap,
  });
  final String title;
  final String signInOut;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyles.font11BlackRegular,
          ),
          TextSpan(
            text: signInOut,
            style: TextStyles.font11BlueSemiBold,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
