import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_spacing.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/route_strings.dart';
import '../../widgets/image_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                          "Profile",
                          suffix: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteString.settingsScreen);
                              },child: ImageView(path: AppImages.icSettings)),

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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Column(
                  children: [
                    AppSpacing.h10,
                    Row(
                      children: [
                        // Avatar
                        Container(
                          height: 80.h,
                          width: 80.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.colorD9D9D9),
                          ),
                          child: Center(
                            child: Text(
                              "JS",
                            ).boldText(AppColors.color333333, 24.sp),
                          ),
                        ),

                        SizedBox(width: 14.w),

                        // Name + Join Date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Arsen Asatryan",
                              ).boldText(AppColors.color333333, 20.sp),
                              SizedBox(height: 8.h),
                              Text(
                                "Joined April 22, 2022",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey.shade600,
                                ),
                              ).regularText(AppColors.color333333.withValues(alpha: 0.6), 12.sp),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30.h),

                    // Stats row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _statItem(
                          icon: Icons.verified,
                          value: "2,012",
                          label: "Jobs Completed",
                        ),
                        _statItem(
                          icon: Icons.star_rounded,
                          value: "99",
                          label: "All-Time NPS",
                        ),
                      ],
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

// Reusable stat widget
Widget _statItem({
  required IconData icon,
  required String value,
  required String label,
}) {
  return Expanded(
    child: Row(
      children: [
        SizedBox(width: 10.w),
        Icon(icon, color: AppColors.color3332CA, size: 22),
        SizedBox(width: 14.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
                color: Colors.black,
              ),
            ).boldText(AppColors.color333333, 15.sp),
            AppSpacing.h8,
            Text(
              label,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 11.sp),
            ).regularText(AppColors.color333333.withValues(alpha: 0.8), 11.sp),
          ],
        ),
      ],
    ),
  );
}
