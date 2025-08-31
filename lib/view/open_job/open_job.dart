import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_images.dart';
import 'package:home_alliance/widgets/image_view.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_spacing.dart';

class OpenJobPage extends StatelessWidget {
  const OpenJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 15.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CommonWidgets.appBar(
              "Back",
              suffix: Container(
                height: 32.h,
                width: 111.w,
                decoration: BoxDecoration(
                  color: AppColors.colorFF4747,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text("CLOSE JOB").boldText(AppColors.white, 14.sp),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.h32,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Job Title
                      Text(
                        "Appliance Repair",
                      ).semiBoldText(AppColors.color333333, 20.sp),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 11.w,
                          vertical: 7.5.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.colorFFC917,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          "IN PROGRESS",
                        ).boldText(AppColors.color333333, 10.sp),
                      ),
                    ],
                  ),

                  SizedBox(height: 5.h),
                  Text("Job #FKZJQE").regularText(AppColors.color333333, 14.sp),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      Container(
                        height: 7.h,
                        width: 7.w,
                        decoration: BoxDecoration(
                          color: AppColors.color293359,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Text(
                        "Organic Lead",
                      ).regularText(AppColors.color293359, 14.sp),
                    ],
                  ),
                  SizedBox(height: 40.h),

                  // Appointment Section
                  sectionTitle("Appointment"),
                  divider(),
                  detailRow("Type of Service:", "Repair/Service, Toilet/Sink"),
                  detailRow(
                    "Location:",
                    "4118 Davana Road, Los Angeles, CA 91423",
                  ),

                  SizedBox(height: 32.h),

                  // Customer Info
                  sectionTitle("Customer Info"),
                  divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Patricia Jimenez").semiBoldText(
                            AppColors.color333333.withValues(alpha: 0.8),
                            16.sp,
                          ),
                          SizedBox(height: 5.h),
                          Text("May 5, 2025").regularText(
                            AppColors.color333333.withValues(alpha: 0.8),
                            14.sp,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ImageView(path: AppImages.icChat),
                          AppSpacing.w20,
                          ImageView(path: AppImages.icPhone),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Text("+1 (747) 369-4394").regularText(
                    AppColors.color333333.withValues(alpha: 0.8),
                    14.sp,
                  ),SizedBox(height: 5.h),
                  Text("tmqueen13@icloud.com").regularText(
                    AppColors.color333333.withValues(alpha: 0.8),
                    14.sp,
                  ),

                  SizedBox(height: 30.h),
                  detailRow(
                    "Location:",
                    "4118 Davana Road, Los Angeles, CA 91423",
                  ),

                  SizedBox(height: 10.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: ImageView(
                        path: AppImages.icDMap,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
    ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp);
  }

  Widget divider() {
    return Column(
      children: [
        AppSpacing.h10,
        Container(
          height: 1.h,
          width: double.maxFinite,
          color: AppColors.colorCCCCCC,
        ),
        AppSpacing.h10,
      ],
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              title,
            ).regularText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
          ),
          Expanded(
            child: Text(
              value,
            ).regularText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
          ),
        ],
      ),
    );
  }
}
