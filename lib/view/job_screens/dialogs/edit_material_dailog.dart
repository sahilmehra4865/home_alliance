import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';

import '../../../helper/decoration.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_spacing.dart';
import '../../../widgets/image_view.dart';

class EditPartsDialog extends StatelessWidget {
  const EditPartsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Edit Parts & Materials",
            ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
            divider(),
            AppSpacing.h24,

            // ITEM 1
            _buildPartItem(title: "Pipes", price: 70, quantity: 1, total: 70),

            const SizedBox(height: 20),

            // ITEM 2
            _buildPartItem(title: "Pipes", price: 70, quantity: 2, total: 140),

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

  Widget _buildPartItem({
    required String title,
    required double price,
    required int quantity,
    required double total,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row
        Row(
          children: [
            ImageView(path: AppImages.icBox, height: 23.h, width: 23.w),
            SizedBox(width: 8.w),
            Text(title).boldText(AppColors.color333333, AppDimensions.d12.sp),
            const Spacer(),
            const Icon(Icons.remove, color: Colors.red),
          ],
        ),

        const SizedBox(height: 14),

        /// Quantity - Price - Total Row
        Row(
          children: [
            // PRICE
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Price",
                ).regularText(AppColors.color949494, AppDimensions.d10.sp),
                const SizedBox(height: 7),
                _inputBox("\$${price.toStringAsFixed(2)}"),
              ],
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("×"),
                ),
              ),
            ),
            // QUANTITY
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Quantity",
                ).regularText(AppColors.color949494, AppDimensions.d10.sp),
                const SizedBox(height: 7),
                _inputBox(quantity.toString()),
              ],
            ),

            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("="),
                ),
              ),
            ),

            // TOTAL
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total",
                ).regularText(AppColors.color949494, AppDimensions.d10.sp),
                const SizedBox(height: 7),
                _inputBox("\$${total.toStringAsFixed(2)}"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _inputBox(String text) {
    return Container(
      height: 30,
      width: 78,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.colorD9D9D9),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
            ).semiBoldText(AppColors.color555555, AppDimensions.d10.sp),
          ],
        ),
      ),
    );
  }
}
