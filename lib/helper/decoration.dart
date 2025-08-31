import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimension.dart';

class ViewDecoration {
  static InputDecoration inputDecoration(String fieldName, Color color,
      {Widget? suffixIcon,
      Widget? prefixIcon,
      Widget? prefix,
      EdgeInsetsGeometry? contentPadding,
      TextStyle? hintStyle,
      String? errorText,
      BoxConstraints? prefixBoxConstraints,
      BoxConstraints? suffixBoxConstraints,
      double? radius = 0.0,
      Color? borderColor,
      double? borderWidth = AppDimensions.d1}) {
    return InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixBoxConstraints ?? const BoxConstraints(),
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixBoxConstraints ?? const BoxConstraints(),
        hintText: fieldName.tr,
        //errorText: errorText,
        hintStyle: hintStyle ?? textStyle(AppDimensions.d14, AppColors.colorB7B7B7, FontWeight.w400),
        filled: true,
        fillColor: color,
        contentPadding:
            contentPadding ?? EdgeInsets.symmetric(vertical: AppDimensions.d13.h, horizontal: AppDimensions.d16.w),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? AppColors.hintGrey, width: borderWidth!.w),
            borderRadius: BorderRadius.all(Radius.circular(radius!.r))),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(radius.r))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? AppColors.hintGrey, width: borderWidth.w),
            borderRadius: BorderRadius.all(Radius.circular(radius.r))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black, width: borderWidth.w),
            borderRadius: BorderRadius.all(Radius.circular(radius.r))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black, width: borderWidth.w),
            borderRadius: BorderRadius.all(Radius.circular(radius.r))));
  }

  static TextStyle textStyle(double size, Color color, FontWeight fontWeight,
      {TextDecoration decoration = TextDecoration.none}) {
    return TextStyle(fontWeight: fontWeight, fontSize: (size).sp, color: color, decoration: decoration, fontFamily: "Inter");
    // GoogleFonts.roboto(fontWeight: fontWeight, fontSize: size.sp, color: color, decoration: decoration);
  }
}
