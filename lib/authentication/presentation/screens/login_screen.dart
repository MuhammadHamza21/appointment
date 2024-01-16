// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:appointment/authentication/domain/usecases/login.dart';
import 'package:appointment/authentication/presentation/controller/auth_cubit.dart';
import 'package:appointment/authentication/presentation/controller/auth_state.dart';
import 'package:appointment/authentication/presentation/widgets/already_have_account_text.dart';
import 'package:appointment/authentication/presentation/widgets/terms_and_conditions_text.dart';
import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/themes/colors.dart';
import 'package:appointment/core/themes/styles.dart';
import 'package:appointment/core/widgets/app_text_button.dart';
import 'package:appointment/core/widgets/app_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObsecureText = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        hintText: "Email",
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [
                          AutofillHints.email,
                        ],
                      ),
                      verticalSpace(18),
                      AppTextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: "Password",
                        isObsecureText: isObsecureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObsecureText = !isObsecureText;
                            });
                          },
                          child: Icon(
                            isObsecureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.darkerGrey,
                          ),
                        ),
                        autofillHints: const [
                          AutofillHints.password,
                        ],
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpace(40),
                      BlocConsumer<AuthCubit, AuthState>(
                        builder: (context, state) {
                          final authCubit = AuthCubit.get(context);
                          return state is LoginLoadingState
                              ? const CircularProgressIndicatorWidget()
                              : AppTextButton(
                                  title: "Login",
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus!
                                        .unfocus();
                                    authCubit.login(
                                      LoginParams(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  },
                                );
                        },
                        listener: (context, state) {
                          final authCubit = AuthCubit.get(context);
                          if (state is LoginLoadingState) {
                            print("Loading...");
                          }
                          if (state is LoginErrorState) {
                            print("Error, ${authCubit.loginMessage}");
                          }
                          if (state is LoginOfflineState) {
                            print("Offline, ${authCubit.loginMessage}");
                          }
                          if (state is LoginSuccessState) {
                            print("Loaded");
                          }
                        },
                      ),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const AlreadyHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularProgressIndicatorWidget extends StatelessWidget {
  const CircularProgressIndicatorWidget({
    super.key,
    this.color = AppColors.primaryColor,
    this.verticalPadding,
  });

  final Color color;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding != null ? verticalPadding!.h : 8.h),
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}
