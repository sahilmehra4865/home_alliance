import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/helper/common_widgets.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_images.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/widgets/image_view.dart';
import 'package:home_alliance/widgets/scroll_behaviour.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_dimension.dart';
import '../../utils/route_strings.dart';

class KnowledgeCenterPage extends StatelessWidget {
  const KnowledgeCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 60.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CommonWidgets.appBar("knowledge_center"),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSpacing.h40,
                          Text(
                            "need_assistance",
                          ).boldText(AppColors.color333333, AppDimensions.d20.sp),
                          AppSpacing.h19,

                          // Search Field
                          SearchTextField(
                            controller: TextEditingController(),
                            hint: "ask_anything".tr,
                          ),
                          AppSpacing.h35,

                          // Browse by Category
                          Text(
                            "brows_by_categories",
                          ).boldText(AppColors.color333333, AppDimensions.d16.sp),
                          AppSpacing.h19,

                          // Category Buttons
                          _buildCategoryTile(AppImages.icBook, "Getting Started"),
                          _buildCategoryTile(
                            AppImages.icBag,
                            "Job & Service Protocols",
                          ),
                          _buildCategoryTile(AppImages.icTools, "Tools & Equipment"),

                          AppSpacing.h35,

                          // Trending Topics
                          Text(
                            "trending_topics",
                          ).boldText(AppColors.color333333, AppDimensions.d16.sp),
                          AppSpacing.h26,

                          // Horizontal Scroll
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 210.h,
                      child: ScrollConfiguration(
                        behavior: NoGlowScrollBehavior(),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 20.w),
                          children: [
                            _buildTrendingCard(
                              "How to Handle Late Arrivals",
                              AppImages.icBusinessMan,
                            ),
                            AppSpacing.w25,
                            _buildTrendingCard(
                              "Complete Your Profile",
                                AppImages.icBusinessMan,
                            ),
                          ],
                        ),
                      ),
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

  // Category Card Widget
  Widget _buildCategoryTile(String iconPath, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          ImageView(path: iconPath),
          AppSpacing.w20,
          Text(title).regularText(AppColors.color333333, AppDimensions.d16.sp),
        ],
      ),
    );
  }

  // Trending Topics Card
  Widget _buildTrendingCard(String title, String imageUrl) {
    return SizedBox(
      width: 289.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5.r)),
            child: ImageView(path: imageUrl, height: 147.h),
          ),
          AppSpacing.h18,
          Text(title).boldText(
            AppColors.color333333,
            AppDimensions.d16.sp,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isError = errorText != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.maxFinite,
          height: AppDimensions.d59.h,
          child: TextField(
            controller: controller,
            readOnly: true,
            onTap:(){
              Get.toNamed(RouteString.knowledgeCenterSearchPage);
            },
            cursorHeight: AppDimensions.d18.h,
            onChanged: onChanged,
            style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.color333333.withValues(alpha: 0.6),
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 24.sp,
                color: AppColors.color333333.withValues(alpha: 0.6),
              ),
              // suffixIcon: Icon(
              //   Icons.mic,
              //   size: 24.sp,
              //   color: AppColors.color333333.withValues(alpha: 0.6),
              // ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppDimensions.d16.w,
                vertical: AppDimensions.d18.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                borderSide: BorderSide(
                  color: isError
                      ? AppColors.colorDD2E44
                      : AppColors.colorCCCCCC,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                borderSide: BorderSide(
                  color: isError
                      ? AppColors.colorDD2E44
                      : AppColors.colorCCCCCC,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                borderSide: BorderSide(
                  color: isError
                      ? AppColors.colorDD2E44
                      : AppColors.colorCCCCCC,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        if (isError) ...[
          AppSpacing.h10,
          Text(
            errorText!,
          ).regularText(AppColors.colorDD2E44, AppDimensions.d14.sp),
        ],
      ],
    );
  }
}
