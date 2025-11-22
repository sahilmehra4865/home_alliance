import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/helper/decoration.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_spacing.dart';

class AddEstimateDialog extends StatelessWidget {
  const AddEstimateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Add New Estimate",
            ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
            divider(),
            AppSpacing.h24,
            Text("Estimate").regularText(AppColors.color333333, 10.sp),

            const SizedBox(height: 8),
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

                SizedBox(width: 12.w),

                // Save Button
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    decoration: BoxDecoration(
                      color: AppColors.color293359,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: Text("Save").boldText(AppColors.white, 14.sp),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Text("Estimate History").semiBoldText(AppColors.color333333, 12.sp),
            SizedBox(height: 16.h),
            _buildHistoryRow("10/10/2025", "Alex Yurkov", "\$1000.00"),
            SizedBox(height: 16.h),
            _buildHistoryRow("10/10/2025", "Alex Yurkov", "\$100.00"),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryRow(String date, String name, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$date       $name").regularText(AppColors.color333333, 12.sp),
        Text(amount).regularText(AppColors.color333333, 12.sp),
      ],
    );
  }
}
