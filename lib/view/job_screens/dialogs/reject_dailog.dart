import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_spacing.dart';

class ReasonForRejectDialog extends StatefulWidget {
  const ReasonForRejectDialog({super.key});

  @override
  State<ReasonForRejectDialog> createState() => _ReasonForRejectDialogState();
}

class _ReasonForRejectDialogState extends State<ReasonForRejectDialog> {
  String? selectedReason;

  final List<String> reasons = [
    "Too far/outside service area",
    "Service not in my skill set",
    "Customer issue or prior negative experience",
    "Price too low, not worth effort",
    "Other (with text field)",
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reason for Reject",
            ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
            divider(),
            AppSpacing.h14,
            // Dropdown
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.colorD9D9D9),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text(
                    "Select a reason",
                  ).regularText(AppColors.colorD9D9D9, 14.sp),
                  isExpanded: true,
                  value: selectedReason,
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  items: reasons
                      .map(
                        (reason) => DropdownMenuItem<String>(
                          value: reason,
                          child: Text(
                            reason,
                          ).regularText(AppColors.color555555, 14.sp),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 24.h),

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
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.colorCCCCCC),
                    ),
                    child: Text(
                      "Cancel",
                    ).regularText(AppColors.color555555, 14.sp),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: selectedReason != null
                      ? () {
                          // Handle submit
                          Navigator.pop(context, selectedReason);
                        }
                      : null,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 9.h,
                      horizontal: 32.w,
                    ),
                    decoration: BoxDecoration(
                      color: selectedReason != null
                          ? AppColors.color3332CA
                          : AppColors.colorD9D9D9,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text("Submit").regularText(AppColors.white, 14.sp),
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