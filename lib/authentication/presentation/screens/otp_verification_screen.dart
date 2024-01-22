import 'package:appointment/authentication/presentation/controller/auth_cubit.dart';
import 'package:appointment/authentication/presentation/controller/auth_state.dart';
import 'package:appointment/authentication/presentation/widgets/otp_field_widget.dart';
import 'package:appointment/core/helpers/extensions.dart';
import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/routing/routes.dart';
import 'package:appointment/core/themes/styles.dart';
import 'package:appointment/core/widgets/app_back_button.dart';
import 'package:appointment/core/widgets/app_text_button.dart';
import 'package:appointment/core/widgets/circular_progress_indicator.dart';
import 'package:appointment/core/widgets/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerificationScreen extends HookWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50.h,
            horizontal: 30.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBackButton(),
              verticalSpace(32),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OTP Verification",
                        style: TextStyles.font24BlueBold,
                      ),
                      verticalSpace(8),
                      Text(
                        "Please enter the 4-digit verification code that was sent to your mobile phone",
                        style: TextStyles.font14GreyRegular,
                      ),
                      verticalSpace(64),
                      OtpFieldWidget(
                        controller: controller,
                        onCodeChanged: (p0) {
                          if (p0!.length == 4) {
                            checkOTP(context, controller.text);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              BlocConsumer<AuthCubit, AuthState>(
                builder: (context, state) {
                  return state is CheckOtpCodeLoadingState
                      ? const CircularProgressIndicatorWidget()
                      : AppTextButton(
                          onPressed: () {
                            checkOTP(context, controller.text);
                          },
                          title: "Submit",
                        );
                },
                listener: (context, state) {
                  if (state is CheckOtpCodeSuccessState) {
                    context.pushNamedAndRemoveUntil(
                      Routes.homeLayout,
                      predicate: (_) {
                        return true;
                      },
                    );
                  } else if (state is CheckOtpCodeErrorState ||
                      state is CheckOtpCodeOfflineState) {
                    SnackbarMessage()
                        .showErrorSnackBar(context: context, message: "Error");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void checkOTP(BuildContext context, String otpCode) async {
  final authCubit = AuthCubit.get(context);
  if (otpCode.isNotEmpty && otpCode.length == 4) {
    if (otpCode == "0000" || otpCode == "1234") {
      FocusManager.instance.primaryFocus!.unfocus();
      authCubit.checkOtpCode();
    } else {
      SnackbarMessage().showErrorSnackBar(
        context: context,
        message: "OTP is not correct",
      );
    }
  } else {
    SnackbarMessage().showErrorSnackBar(
      context: context,
      message: "Please enter OTP code",
    );
  }
}
