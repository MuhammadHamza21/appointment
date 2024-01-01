import 'package:appointment/core/themes/styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyles.font11BlackRegular,
        ),
        TextSpan(
          text: 'Sign Up',
          style: TextStyles.font11BlueSemiBold,
        ),
      ]),
    );
  }
}
