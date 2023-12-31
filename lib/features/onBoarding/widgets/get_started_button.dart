import 'package:appointment/core/helpers/extensions.dart';
import 'package:appointment/core/routing/routes.dart';
import 'package:appointment/core/themes/colors.dart';
import 'package:appointment/core/themes/styles.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
          backgroundColor:
              const MaterialStatePropertyAll(AppColors.primaryColor),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 52)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ))),
      child: Text(
        "Get Started",
        style: TextStyles.font16White500Wight,
      ),
    );
  }
}
