import 'package:appointment/authentication/presentation/widgets/alternative_sign_in_widget.dart';
import 'package:appointment/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class AlternativeSignInButtonsWidget extends StatelessWidget {
  const AlternativeSignInButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlternativeSignInWidget(
          imageSrc: "assets/images/google_logo.png",
          onPressed: () {},
        ),
        horizontalSpace(32),
        AlternativeSignInWidget(
          imageSrc: "assets/images/facebook_logo.png",
          onPressed: () {},
        ),
        horizontalSpace(32),
        AlternativeSignInWidget(
          imageSrc: "assets/images/apple_logo.png",
          onPressed: () {},
        ),
      ],
    );
  }
}
