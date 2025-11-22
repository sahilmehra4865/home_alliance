import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_images.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';
import 'package:home_alliance/widgets/image_view.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_spacing.dart';

class EditPaymentsDialog extends StatelessWidget {
  const EditPaymentsDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE
            Text(
              "Edit Payments",
            ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
            divider(),
            AppSpacing.h24,

            /// LIST ITEMS
            _paymentItem(
              name: "Alex Yurkov",
              type: "Cash",
              date: "10/10/2025",
              amount: "\$1000.00",
              icon: Icons.qr_code_2,
            ),

            AppSpacing.h24,

            _paymentItem(
              name: "Alex Yurkov",
              type: "Cash",
              date: "10/10/2025",
              amount: "\$1000.00",
              icon: Icons.credit_card, // Use your Mastercard asset instead
            ),

            AppSpacing.h24,

            _paymentItem(
              name: "Alex Yurkov",
              type: "Cash",
              date: "10/10/2025",
              amount: "\$1000.00",
              icon: Icons.qr_code_2,
            ),

            AppSpacing.h24,

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

  Widget _paymentItem({
    required String name,
    required String type,
    required String date,
    required String amount,
    required IconData icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LEFT ICON BOX
        Container(
          height: 56.h,
          width: 56.w,
          decoration: BoxDecoration(
            color: AppColors.colorF5F5F5,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child:Center(
            child: ImageView(
              path: AppImages.icImage,
            ),
          ),
        ),

        SizedBox(width: 20.w),

        /// TEXT SECTION
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ).boldText(AppColors.color333333, 12.sp),

              const SizedBox(height: 4),

              Row(
                children: [
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ).regularText(AppColors.color293359, 10.sp),
                  const SizedBox(width: 6),
                  Container(height: 14, width: 1, color: AppColors.colorD9D9D9),
                  const SizedBox(width: 6),
                  Text(
                    date,
                  ).regularText(AppColors.color949494, 10.sp),
                ],
              ),

              SizedBox(height: 12.h),
              Text(
                amount,
              ).regularText(AppColors.color333333, 12.sp),
            ],
          ),
        ),

        /// REMOVE BUTTON
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Icon(Icons.remove, color: Colors.red, size: 22),
        ),
      ],
    );
  }
}
