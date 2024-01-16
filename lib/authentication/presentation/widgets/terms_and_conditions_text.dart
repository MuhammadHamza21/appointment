import 'package:appointment/core/themes/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: 'By logging, you agree to our ',
          style: TextStyles.font13DarkerGreyRegular,
        ),
        TextSpan(
          text: "Terms & Conditions ",
          style: TextStyles.font13BlackMedium,
        ),
        TextSpan(
          text: "and ",
          style: TextStyles.font13DarkerGreyRegular,
        ),
        TextSpan(
          text: "PrivacyPolicy.",
          style: TextStyles.font13BlackMedium.copyWith(height: 1.5),
        ),
      ]),
    );
  }
}
