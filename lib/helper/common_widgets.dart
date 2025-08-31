import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/utils/app_extensions.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimension.dart';
import '../utils/app_spacing.dart';

class CommonWidgets {
  static void hideKeyBoard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  //
  static Widget appBar(String title, {Widget? suffix}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.color333333),
        ),

        AppSpacing.w20,
        Expanded(
          child: Text(
            title,
          ).semiBoldText(AppColors.color333333, AppDimensions.d16.sp),
        ),
        suffix ?? Container(),
      ],
    );
  }

  static Widget filterBottomSheetContainer(String value) {
    return Container(
      height: AppDimensions.d32.h,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.d11.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.d5.r),
        border: Border.all(color: AppColors.color727272),
      ),
      child: Text(value).regularText(AppColors.black, AppDimensions.d14),
    );
  }
}
