// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:appointment/core/themes/colors.dart';
import 'package:appointment/core/themes/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.isObsecureText,
    this.suffixIcon,
    this.controller,
    this.textInputAction,
    this.autofillHints,
    this.keyboardType,
    this.validateText,
    this.onFieldSubmitted,
  });
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final bool? isObsecureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final String? validateText;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.lighterGrey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle: hintStyle ?? TextStyles.font14LightGreyMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: AppColors.moreLightGrey,
        filled: true,
      ),
      obscureText: isObsecureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
      validator: (value) {
        if (value!.isEmpty) {
          return validateText;
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
