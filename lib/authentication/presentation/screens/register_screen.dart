import 'package:appointment/authentication/domain/usecases/register.dart';
import 'package:appointment/authentication/presentation/controller/auth_cubit.dart';
import 'package:appointment/authentication/presentation/controller/auth_state.dart';
import 'package:appointment/authentication/presentation/widgets/already_have_account_text.dart';
import 'package:appointment/authentication/presentation/widgets/alternative_sign_in_buttons_widget.dart';
import 'package:appointment/authentication/presentation/widgets/gender_selection_widget.dart';
import 'package:appointment/authentication/presentation/widgets/sign_in_with_widget.dart';
import 'package:appointment/authentication/presentation/widgets/terms_and_conditions_text.dart';
import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/methods/validate_email.dart';
import 'package:appointment/core/themes/colors.dart';
import 'package:appointment/core/themes/styles.dart';
import 'package:appointment/core/widgets/app_phone_field.dart';
import 'package:appointment/core/widgets/app_text_button.dart';
import 'package:appointment/core/widgets/app_text_form_field.dart';
import 'package:appointment/core/widgets/circular_progress_indicator.dart';
import 'package:appointment/core/widgets/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var mobileController = TextEditingController();
  bool isObsecureText = true;
  int groupValue = 0;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 50.h,
              horizontal: 30.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Account",
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpace(17),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextFormField(
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        autofillHints: const [
                          AutofillHints.name,
                        ],
                        validateText: "Name must not be empty",
                        hintText: "Your name",
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [
                          AutofillHints.email,
                        ],
                        validateText: "Email must not be empty",
                        hintText: "Email",
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        hintText: "Password",
                        controller: passwordController,
                        validateText: "Password must not be empty",
                        autofillHints: const [
                          AutofillHints.newPassword,
                        ],
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
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
                      ),
                      verticalSpace(16),
                      AppPhoneField(
                        hintText: "Your Number",
                        controller: mobileController,
                        textInputAction: TextInputAction.done,
                        validateText: "Number must not be empty",
                      ),
                      verticalSpace(16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          "Gender",
                          style: TextStyles.font14GreyRegular,
                        ),
                      ),
                      GenderSelectionWidget(
                        onChanged: (p) {
                          setState(() {
                            groupValue = p!;
                          });
                        },
                        groupValue: groupValue,
                      ),
                      verticalSpace(32.h),
                      BlocConsumer<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return state is RegisterLoadingState
                              ? const CircularProgressIndicatorWidget()
                              : AppTextButton(
                                  onPressed: () {
                                    final authCubit = AuthCubit.get(context);
                                    if (formKey.currentState!.validate()) {
                                      if (validateEmail(
                                          email: emailController.text)) {
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                        authCubit.register(
                                          RegisterParams(
                                            name: nameController.text,
                                            gender: groupValue,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            mobileNumber: mobileController.text,
                                          ),
                                        );
                                      } else {
                                        SnackbarMessage().showErrorSnackBar(
                                          context: context,
                                          message: "Invalid Email format",
                                        );
                                      }
                                    }
                                  },
                                  title: "Create Account",
                                );
                        },
                        listener: (context, state) {
                          final authCubit = AuthCubit.get(context);
                          if (state is RegisterSuccessState) {
                            SnackbarMessage().showSuccessSnackBar(
                              context: context,
                              message: "Loggedin Succesfully",
                            );
                          } else if (state is RegisterErrorState ||
                              state is RegisterOfflineState) {
                            SnackbarMessage().showErrorSnackBar(
                              context: context,
                              message: authCubit.registerMessage,
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
                      Center(
                        child: AlreadyHaveAccountText(
                          title: "Already have an account? ",
                          signInOut: "Sign in",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
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
