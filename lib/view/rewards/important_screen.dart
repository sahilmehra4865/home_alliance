import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../widgets/image_view.dart';

class ImportantScreen extends StatelessWidget {
  const ImportantScreen({super.key});

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
                          "Important",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ImageView(
                    path: AppImages.icRewards,
                  ),

                  SizedBox(height: 32.h),

                  // MAIN TITLE
                  Text(
                    "Technician Accountability",
                  ).semiBoldText(AppColors.color333333, 14.sp),

                  SizedBox(height: 16.h),

                  Text(
                    "If a customer cancels their Home Alliance membership because of a service issue linked to your visit (like overcharging, poor experience, or confirmed complaint), you'll need to help make it right.",
                  ).regularText(AppColors.color555555, 12.sp),

                  SizedBox(height: 35.h),

                  // SECTION TITLE
                  Text(
                    "How It Works:",
                  ).semiBoldText(AppColors.color333333, 14.sp),

                  SizedBox(height: 24.h),

                  // BULLET POINTS
                  _bullet(
                    "After the first validated cancellation, you'll be responsible for getting 1 new member to sign up.",
                  ),
                  _bullet(
                    "If it happens again, you'll need to get 2 new sign-ups.",
                  ),
                  _bullet(
                    "On the third time, it increases to 3 new sign-ups.",
                  ),
                  _bullet(
                    "After that, each additional cancellation tied to your service adds one more sign-up to your responsibility.",
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// BULLET WIDGET
Widget _bullet(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 25.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Icon(
            Icons.play_arrow_rounded,
            size: 16,
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
          ).regularText(AppColors.color555555, 13.sp),
        ),
      ],
    ),
  );
}
