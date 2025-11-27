import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/widgets/image_view.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_images.dart';

class HowToEarnRewardsScreen extends StatelessWidget {
  const HowToEarnRewardsScreen({super.key});

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
                          "How to Earn Rewards",
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IMAGE BOX
                  ImageView(
                    path: AppImages.icRewards,
                  ),

                  SizedBox(height: 22.h),

                  // MAIN TITLE
                  Text(
                    "How to earn Membership Rewards?",
                  ).semiBoldText(AppColors.color333333, 14.sp),

                  SizedBox(height: 14.h),

                  // Description paragraph
                  Text(
                    "After selling a Home Alliance Membership to a customer, you start earning the following rewards:",
                  ).regularText(AppColors.color555555, 12.sp),

                  SizedBox(height: 35.h),

                  // BULLET LIST
                  _bullet(
                    "The full amount of the first membership subscription payment (e.g. \$49.95 for Silver Monthly Subscription).",
                  ),
                  _bullet(
                    "10% of the recurring payments by customers until they cancel the membership (20% if you have 5 or more active members subscribed by you).",
                  ),
                  _bullet(
                    "\$50 or 20% of HomeAlliance profit margin from each closed and paid job, that was booked by one of the members signed by you that hold active membership subscription.",
                  ),

                  SizedBox(height: 10.h),

                  // Bottom NOTE text
                  Text(
                    "The minimum amount to withdraw is \$150.\n"
                    "In order to withdraw, contact us in a timely manner and we will issue a monthly paycheck with the requested amount.",
                  ).regularText(AppColors.color555555, 12.sp),

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
          padding: const EdgeInsets.only(top: 1),
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
            style: TextStyle(
              fontSize: 13.sp,
              height: 1.4,
              color: Colors.grey.shade700,
            ),
          ).regularText(AppColors.color555555, 12.sp),
        ),
      ],
    ),
  );
}
