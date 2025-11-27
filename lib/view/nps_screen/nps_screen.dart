import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_images.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/widgets/image_view.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_colors.dart';

class YourNpsScreen extends StatelessWidget {
  const YourNpsScreen({super.key});

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
                        child: CommonWidgets.appBarCenterTitle("Your NPS"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Illustration
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: ImageView(path: AppImages.icNps),
                  ),

                  const SizedBox(height: 32),

                  // Title
                  Text(
                    "What Is NPS?",
                  ).semiBoldText(AppColors.color333333, 14.sp),
                  const SizedBox(height: 12),

                  Text(
                    "NPS is a metric that measures customer loyalty and "
                    "satisfaction by asking how likely customers are to recommend "
                    "a product or service to others.",
                  ).regularText(AppColors.color333333, 12.sp),

                  const SizedBox(height: 52),

                  Center(
                    child: Text("NPS SCORE = % Promoters - % Detractors")
                        .semiBoldText(
                          AppColors.color333333,
                          14.sp,
                          align: TextAlign.center,
                        ),
                  ),

                  const SizedBox(height: 24),

                  // Detractors Section
                  _npsItem(
                    icon: Icons.sentiment_very_dissatisfied,
                    iconColor: Colors.red,
                    title: "Detractors (scores 0–6)",
                    desc:
                        "Unhappy customers who could potentially harm your brand’s reputation "
                        "through negative reviews.",
                  ),

                  Divider(
                    height: 60,
                    thickness: 1,
                    color: AppColors.colorD9D9D9,
                  ),

                  // Passives Section
                  _npsItem(
                    icon: Icons.sentiment_neutral,
                    iconColor: Colors.orange,
                    title: "Passives (scores 7–8)",
                    desc:
                        "Satisfied but not enthusiastic customers who might easily switch to competitors.",
                  ),

                  Divider(
                    height: 60,
                    thickness: 1,
                    color: AppColors.colorD9D9D9,
                  ),

                  // Promoters Section
                  _npsItem(
                    icon: Icons.sentiment_satisfied_alt,
                    iconColor: Colors.green,
                    title: "Promoters (scores 9–10)",
                    desc:
                        "Satisfied but not enthusiastic customers who might easily switch to competitors.",
                  ),
                  const SizedBox(height: 52),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _npsItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String desc,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 40),
        AppSpacing.h16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title).boldText(AppColors.color555555, 12.sp),
            const SizedBox(height: 12),
            Text(desc).regularText(AppColors.color555555, 12.sp),
          ],
        ),
      ],
    );
  }
}
