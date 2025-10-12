import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/helper/common_widgets.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_images.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/utils/route_strings.dart';
import 'package:home_alliance/widgets/image_view.dart';
import 'package:home_alliance/widgets/scroll_behaviour.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';

class KnowledgeCenterSearchPage extends StatelessWidget {
  const KnowledgeCenterSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 60.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CommonWidgets.appBar(
              "knowledge_center",
              suffix: Text("cancel").semiBoldText(
                AppColors.color333333,
                AppDimensions.d16.sp,
              ),
            ),
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
                          AppSpacing.h26,
                          Container(
                            height: 1.h,
                            width: double.maxFinite,
                            color: AppColors.colorCCCCCC,
                          ),
                          AppSpacing.h26,
                          RecentSearchWidget(),
                        ],
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
}

class RecentSearchWidget extends StatelessWidget {
  final List<String> recentSearches = [
    "How to",
    "How to unclog the toilet",
    "tissue shortage",
    "mhe dd",
    "what if I arrive late?",
  ];

  RecentSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "recent_search",
            ).boldText(AppColors.color333333, AppDimensions.d16.sp),
          ],
        ),
        AppSpacing.h30,

        // Search items
        Column(
          children: recentSearches.map((text) {
            return GestureDetector(
              onTap: (){
                Get.toNamed(RouteString.searchResultsPage);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    ImageView(
                      path: AppImages.icTime,
                    ),
                    AppSpacing.w15,
                    Expanded(
                      child: Text(text).regularText(
                        AppColors.color333333.withValues(alpha: 0.8),
                        AppDimensions.d20.sp,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AppSpacing.w5,
                  /*  GestureDetector(
                      onTap: () {
                        // delete single item logic here
                      },
                      child:  ImageView(
                        path: AppImages.icCancel,
                        color: AppColors.color333333.withValues(alpha: 0.6),
                      ),
                    ),*/
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
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
            cursorHeight: AppDimensions.d18.h,
            onChanged: onChanged,
            onSubmitted: (v){
              Get.toNamed(RouteString.searchResultsPage);
            },
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






