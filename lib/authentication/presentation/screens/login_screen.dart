// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appointment/authentication/presentation/widgets/alternative_sign_in_buttons_widget.dart';
import 'package:appointment/core/helpers/extensions.dart';
import 'package:appointment/core/methods/validate_email.dart';
import 'package:appointment/core/routing/routes.dart';
import 'package:appointment/core/widgets/circular_progress_indicator.dart';
import 'package:appointment/core/widgets/snackbar_message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:appointment/authentication/domain/usecases/login.dart';
import 'package:appointment/authentication/presentation/controller/auth_cubit.dart';
import 'package:appointment/authentication/presentation/controller/auth_state.dart';
import 'package:appointment/authentication/presentation/widgets/already_have_account_text.dart';
import 'package:appointment/authentication/presentation/widgets/sign_in_with_widget.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
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
                        validateText: "Email must not be empty",
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(18),
                      AppTextFormField(
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
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
                        validateText: "Password must not be empty",
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: RichText(
                          text: TextSpan(
                            text: "Forgot Password?",
                            style: TextStyles.font13BlueRegular,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context
                                  .pushNamed(Routes.forgotPasswordScreen),
                          ),
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
                                    if (formKey.currentState!.validate()) {
                                      if (validateEmail(
                                          email: emailController.text)) {
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                        authCubit.login(
                                          LoginParams(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ),
                                        );
                                      } else {
                                        SnackbarMessage().showErrorSnackBar(
                                          context: context,
                                          message: "Invalid email format",
                                        );
                                      }
                                    }
                                  },
                                );
                        },
                        listener: (context, state) {
                          final authCubit = AuthCubit.get(context);
                          if (state is LoginSuccessState) {
                            context.pushNamed(Routes.otpVerificationScreen);
                          } else if (state is LoginErrorState ||
                              state is LoginOfflineState) {
                            SnackbarMessage().showErrorSnackBar(
                              context: context,
                              message: authCubit.loginMessage,
                            );
                          }
                        },
                      ),
                      verticalSpace(46),
                      const SignInWithWidget(),
                      verticalSpace(32),
                      const AlternativeSignInButtonsWidget(),
                      verticalSpace(32),
                      const TermsAndConditionsText(),
                      verticalSpace(24),
                      AlreadyHaveAccountText(
                        title: 'Don\'t have an account? ',
                        signInOut: "Sign up",
                        onTap: () {
                          context.pushNamed(Routes.registerScreen);
                        },
                      ),
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
