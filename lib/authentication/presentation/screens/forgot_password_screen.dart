import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/themes/styles.dart';
import 'package:appointment/core/widgets/app_back_button.dart';
import 'package:appointment/core/widgets/app_text_button.dart';
import 'package:appointment/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends HookWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50.h,
            horizontal: 30.w,
          ),
          child: Column(
            children: [
              const AppBackButton(),
              verticalSpace(32),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Forgot Password",
                        style: TextStyles.font24BlueBold,
                      ),
                      verticalSpace(8),
                      Text(
                        "At our app, we take the security of your information seriously.",
                        style: TextStyles.font14GreyRegular,
                      ),
                      verticalSpace(32),
                      Form(
                        key: formKey,
                        child: AppTextFormField(
                          hintText: "Email",
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          validateText: "Email must not be empty",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppTextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                title: "Reset Password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
