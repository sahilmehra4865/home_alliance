import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';
import 'package:home_alliance/widgets/drop_down.dart';

import '../../../helper/decoration.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_spacing.dart';

Widget addNewPaymentDialog(BuildContext context) {
  String selectedValue = "Credit Card";
  return StatefulBuilder(
      builder: (context, setState) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  "Add New Payment",
                ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
                divider(),
                AppSpacing.h24,

                /// Appliance Type label
                Text("Appliance Type").regularText(AppColors.color333333, 10.sp),

                const SizedBox(height: 8),

                // Amount + Transaction Row
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Amount").regularText(AppColors.color333333, 10.sp),

                          const SizedBox(height: 8),
                          Container(
                            height: 48.h,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: Row(
                              children: [
                                Text("\$").regularText(
                                  AppColors.color949494,
                                  AppDimensions.d14,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    style: ViewDecoration.textStyle(
                                      AppDimensions.d14,
                                      AppColors.color555555,
                                      FontWeight.w400,
                                    ),

                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "0.00",
                                      hintStyle: ViewDecoration.textStyle(
                                        AppDimensions.d14,
                                        AppColors.color949494,
                                        FontWeight.w400,
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),

                    // Transaction Dropdown
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transaction",
                          ).regularText(AppColors.color333333, 10.sp),

                          const SizedBox(height: 8),
                          MyDropDownWidget(
                            itemList: ["Credit Card", "Check", "Cash"],
                            hint: "Credit Card",
                            selectedValue: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                if (selectedValue == "Credit Card") ...{
                  creditCard(),
                } else ...{
                  addCashImage(selectedValue == "Check", () {}),
                },

                SizedBox(height: 24),

                // Buttons Row
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
                          color: AppColors.colorD9D9D9,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text("Save").boldText(AppColors.white, 14.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  );
}

Widget addCashImage(bool isCheck, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: DottedBorder(
      options: RoundedRectDottedBorderOptions(
        dashPattern: [10, 10],
        strokeWidth: 3,
        radius: Radius.circular(16.r),
        color: AppColors.colorD9D9D9,
      ),
      child: Container(
        height: 190.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.file_upload_outlined,
              size: 24.sp,
              color: AppColors.color555555,
            ),
            SizedBox(height: 12.h),

            Text("Upload Image").regularText(AppColors.color555555, 14.sp),

            SizedBox(height: 6.h),

            Text(
              isCheck
                  ? "Please take picture of check"
                  : "Please take picture of cash",
            ).regularText(AppColors.color949494, 10.sp),
          ],
        ),
      ),
    ),
  );
}

Widget creditCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Card Number
      Text("Card Number").regularText(AppColors.color333333, 10.sp),

      const SizedBox(height: 8),
      Container(
        height: 48.h,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: TextField(
          style: ViewDecoration.textStyle(
            AppDimensions.d14,
            AppColors.color555555,
            FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: "XXXX-XXXX-XXXX",
            border: InputBorder.none,
            hintStyle: ViewDecoration.textStyle(
              AppDimensions.d14,
              AppColors.color949494,
              FontWeight.w400,
            ),
          ),
        ),
      ),

      SizedBox(height: 20),

      // Billing Address
      Text("Billing Address").regularText(AppColors.color333333, 10.sp),

      const SizedBox(height: 8),
      Container(
        height: 48.h,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: TextField(
          maxLines: 2,
          style: ViewDecoration.textStyle(
            AppDimensions.d14,
            AppColors.color555555,
            FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: "Lorem ipsum dolor sit amet...",
            border: InputBorder.none,
            hintStyle: ViewDecoration.textStyle(
              AppDimensions.d14,
              AppColors.color949494,
              FontWeight.w400,
            ),
          ),
        ),
      ),
    ],
  );
}
