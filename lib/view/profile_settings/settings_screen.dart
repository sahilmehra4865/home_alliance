import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_alliance/helper/shared_prefs.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_spacing.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/route_strings.dart';
import '../../widgets/image_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          Container(
            color: AppColors.colorF5F5F5.withValues(alpha: 0.95),
            height: 115.h,
            width: double.maxFinite,
            child: Stack(
              children: [
                ImageView(
                  height: 110.h,
                  width: double.maxFinite,
                  path: AppImages.icBg,
                ),
                Column(
                  children: [
                    SizedBox(height: 70.h),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: CommonWidgets.appBarCenterTitle(
                          "Settings",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppSpacing.h10,
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: (){
                SharedPrefs.clearSharedPrefs();
                Get.offAllNamed(RouteString.loginPage);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.colorD9D9D9),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Log Out",
                    ).boldText(Colors.black, 14.sp),
                    ImageView(
                      height: 24.h,
                      width: 24.w,
                      path: AppImages.icLeft,
                      color: AppColors.colorDD2E44,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
