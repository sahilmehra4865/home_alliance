import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/view/knowledge_center/search_results_controller.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_dimension.dart';
import '../../utils/app_images.dart';
import '../../utils/app_spacing.dart';
import '../../widgets/image_view.dart';
import '../../widgets/scroll_behaviour.dart';
import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchResultsController>(
      builder: (searchResultsController) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                CommonWidgets.appBar(
                  "search_results",
                ),
                AppSpacing.h36,
                // Search Field
                SearchTextField(
                  controller: TextEditingController(text: "How to"),
                  hint: "ask_anything".tr,
                ),
                 AppSpacing.h35,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Results (24)').boldText(AppColors.color333333, AppDimensions.d16.sp),
              AppSpacing.h19,
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color:AppColors.colorCCCCCC),
                        borderRadius: BorderRadius.circular(AppDimensions.d5)
                        
                      ),
                      child: DropdownButton<String>(
                        value: searchResultsController.selectedFilter,
                        underline: const SizedBox(),
                        isDense: true,
                        icon: Padding(
                          padding:  EdgeInsets.only(left: 20.w),
                          child: ImageView(
                            path: AppImages.icDownArrow,
                          ),
                        ),
                        items: searchResultsController.filterOptions
                            .map(
                              (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e).regularText(
                              AppColors.color333333,
                              AppDimensions.d12.sp,
                              align: TextAlign.right,
                            ),
                          ),
                        )
                            .toList(),
                        onChanged: (value) {
                          searchResultsController.selectedFilter = value!;
                          searchResultsController.update();
                        },

                      ),
                    ),
                  ],
                ),
                AppSpacing.h10,
                Expanded(
                  child: ListView.separated(
                    itemCount: searchResultsController.titles.length,
                    padding: EdgeInsets.zero,
                    separatorBuilder: (_, __) =>  Divider(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageView(
                              path: AppImages.icBox,
                            ),
                            AppSpacing.w24,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      searchResultsController.titles[index]
                                  ).boldText(AppColors.color333333, AppDimensions.d16.sp),
                                  AppSpacing.h8,
                                  const Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent luctus, urna vel lacinia auctor",
                                  ).regularText(AppColors.color333333.withValues(alpha: 0.6), AppDimensions.d16.sp),

                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
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