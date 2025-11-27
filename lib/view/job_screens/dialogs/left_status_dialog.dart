import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';
import 'package:home_alliance/widgets/drop_down.dart';

import '../../../helper/decoration.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_spacing.dart';
import '../../../widgets/image_view.dart';

class LeftStatusDialog extends StatelessWidget {
  LeftStatusDialog({super.key});
  final List<String> conditions = [
    "Estimate Provided, Sold",
    "Estimate not provided, estimate in progress",
    "Estimate not provided, not possible to sell",
    "Estimate provided, client refused",
    "Estimate provided, client wants to think",
  ];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.colorF5F5F5,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: ImageView(path: AppImages.icLeft,
                    color: AppColors.color293359,)),
                  ),
                ),

                AppSpacing.w8,

                /// TITLE TEXTS
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Job Status",
                    ).regularText(AppColors.color555555, 12.sp),
                    SizedBox(height: 2),
                    Text(
                      "Left",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ).boldText(AppColors.color555555, 16.sp),
                  ],
                ),

                const Spacer(),
              ],
            ),

            divider(),
            AppSpacing.h24,
            const Text(
              "Left Conditions",
            ).regularText(AppColors.color333333, 10.sp),
            AppSpacing.h8,
            MyDropDownWidget(itemList: conditions, hint: "Select Condition"),

            AppSpacing.h24,

            // Estimate Value
            const Text(
              "Estimate Value",
            ).regularText(AppColors.color333333, 10.sp),

            AppSpacing.h8,
            Row(
              children: [
                // TextField Container
                Expanded(
                  child: Container(
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.colorD9D9D9),
                    ),
                    child: Row(
                      children: [
                        Text("\$").regularText(AppColors.color949494, 14.sp),
                        const SizedBox(width: 8),

                        // Money TextField
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: ViewDecoration.textStyle(
                              AppDimensions.d14,
                              AppColors.color555555,
                              FontWeight.w400,
                            ),
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintTextDirection: TextDirection.rtl,
                              hintText: "0.00",
                              hintStyle: ViewDecoration.textStyle(
                                AppDimensions.d14,
                                AppColors.color949494,
                                FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 100.w),
              ],
            ),

            const SizedBox(height: 28),

            // Buttons Row
            /// BUTTONS
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 9.h,
                      horizontal: 32.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: AppColors.colorCCCCCC),
                    ),
                    child: Text(
                      "Cancel",
                    ).regularText(AppColors.color555555, 14.sp),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // Handle submit
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 9.h,
                      horizontal: 32.w,
                    ),
                    decoration: BoxDecoration(
                      color: /*_wordCount != 0
                          ? AppColors.color3332CA
                          :*/ AppColors.colorD9D9D9,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text("Save").boldText(AppColors.white, 14.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
