import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/helper/routes.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_dimension.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import '../widgets/image_view.dart';

class DialogHelper {
  static Flushbar? myFlushBar;
  static void message(String message, {Color? color, Color? bgColor, bool? isNotError, int? seconds, BuildContext? context}) {
    dismissFlushBar();
    myFlushBar = Flushbar(
      messageText: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon((isNotError ?? false) ? Icons.check_circle_outline : Icons.error_outline, color: color ?? AppColors.white),
            SizedBox(width: AppDimensions.d10.w),
            Expanded(child: Text(message.tr).regularText(color ?? AppColors.white, AppDimensions.d12.sp, align: TextAlign.start)),
          ],
        ),
      ),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: EdgeInsets.fromLTRB(AppDimensions.d20.w, 0.0, AppDimensions.d28.w, 0.0),
      padding: EdgeInsets.fromLTRB(AppDimensions.d14.w, AppDimensions.d8.h, AppDimensions.d12.w, AppDimensions.d8.h),
      borderRadius: BorderRadius.circular(AppDimensions.d10.r),
      backgroundColor: (isNotError ?? false) ? AppColors.primaryDrk : AppColors.red,
      duration: Duration(seconds: seconds ?? 3),
    );
    myFlushBar!.show(Routes.navigatorKey.currentContext!);
  }

  static void dismissFlushBar() {
    if (myFlushBar != null) {
      myFlushBar!.dismiss();
    }
  }
}
