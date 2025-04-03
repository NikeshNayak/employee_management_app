import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/app_colors.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? borderColor;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final void Function()? onTap;
  final double? height;
  final bool readOnly;
  final bool showCursor;

  const CustomTextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.borderColor,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.showCursor = true,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40.h,
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUnfocus,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconConstraints: prefixIconConstraints,
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.lightGreyColor2),
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: borderColor ?? AppColors.lightGreyColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: borderColor ?? AppColors.lightGreyColor, width: 1),
          ),
        ),
        readOnly: readOnly,
        showCursor: showCursor,
      ),
    );
  }
}
