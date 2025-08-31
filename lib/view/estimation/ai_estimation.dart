import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_images.dart';
import 'package:home_alliance/utils/route_strings.dart';
import 'package:home_alliance/widgets/image_view.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_dimension.dart';
import '../../utils/app_spacing.dart';

class AiEstimationPage extends StatelessWidget {
  const AiEstimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15.w),
            CommonWidgets.appBar("Back"),
            AppSpacing.h40,
            ImageView(path: AppImages.icMagic, height: 91.h),
            AppSpacing.h16,
            Text("New Estimate").semiBoldText(AppColors.black, 16.sp),
            AppSpacing.h9,
            Text(
              "Describe & Generate",
            ).regularText(AppColors.color333333.withValues(alpha: 0.6), 14.sp),
            AppSpacing.h60,
            Text(
              "Describe the issue or service performed",
            ).regularText(AppColors.color333333.withValues(alpha: 0.6), 14.sp),
            AppSpacing.h17,
            Container(
                width: double.maxFinite,
                height: 81.h,
                decoration: BoxDecoration(
                  color: AppColors.colorF5F5F5,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text("'Fix leaky kitchen sink'")
                      .regularText(
                      AppColors.color333333.withValues(alpha: 0.6),
                      14.sp,align: TextAlign.center
                  ),
                )
            ),
            AppSpacing.h17,
            Container(
                width: double.maxFinite,
                height: 81.h,
                decoration: BoxDecoration(
                  color: AppColors.colorF5F5F5,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text("'Install new AC unit'")
                      .regularText(
                      AppColors.color333333.withValues(alpha: 0.6),
                      14.sp,align: TextAlign.center
                  ),
                )
            ),
            AppSpacing.h60,
            SearchTextField(
              controller: TextEditingController(),
              hint: "ex. Fix leaky kitchen sink",
            ),
            AppSpacing.h30,
            GestureDetector(
              onTap: (){
                Get.toNamed(RouteString.estimationOutput);
              },
              child: Container(
                width: 138.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.color293359,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Text("Submit")
                        .boldText(
                        AppColors.white,
                        16.sp,align: TextAlign.center
                    ),
                  )
              ),
            ),
          ],
        ),
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
                color: AppColors.color333333.withValues(alpha: 0.2),
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