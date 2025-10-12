import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_spacing.dart';
import '../../widgets/image_view.dart';
import '../../widgets/invoice_bottom_sheet.dart';

class EstimationOutput extends StatelessWidget {
  const EstimationOutput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60.w),
                CommonWidgets.appBar("Back"),
                AppSpacing.h16,
                ImageView(path: AppImages.icMagic, height: 35.h),
                AppSpacing.h9,
                Text("AI Suggestions for").semiBoldText(AppColors.black, 16.sp),
                AppSpacing.h2,
                Text(
                  "“Estimate for Plumbing Leak”",
                ).semiBoldText(AppColors.color293359, 16.sp),
                AppSpacing.h60,
              ],
            ),
            Text("Leak Inspection Fee").semiBoldText(
              AppColors.color293359,
              16.sp,
              align: TextAlign.start,
            ),
            AppSpacing.h10,
            Text("Thorough inspection of leak source").regularText(
              AppColors.color333333.withValues(alpha: 0.6),
              12.sp,
              align: TextAlign.start,
            ),

            AppSpacing.h30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Item Service",
                  ).semiBoldText(AppColors.color333333, 12.sp),
                ),
                SizedBox(
                  width: 30,
                  child: const Text("Qty").semiBoldText(
                    AppColors.color333333,
                    12.sp,
                    align: TextAlign.end,
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text("Total").semiBoldText(
                    AppColors.color333333,
                    12.sp,
                    align: TextAlign.end,
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(height: 12),

            // Item Row
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: 10.h),
                    child: ImageView(path: AppImages.icBox, height: 24.h, width: 24.w),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pipes").boldText(AppColors.color333333, 14.sp),
                        SizedBox(height: 5.h),
                        Text("\$70").regularText(
                          AppColors.color333333.withValues(alpha: 0.6),
                          12.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: Text("2").regularText(
                      AppColors.color333333,
                      12.sp,
                      align: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: const Text("\$140.00").regularText(
                      AppColors.color333333,
                      12.sp,
                      align: TextAlign.end,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 30.h,
                          width: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.r),
                            border: Border.all(color: AppColors.colorCCCCCC),
                          ),
                          child: Center(
                            child: Icon(Icons.mode_edit_outlined, size: 18),
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.r),
                            border: Border.all(color: AppColors.colorCCCCCC),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: AppColors.color293359,
                size: 20,
              ),
              label: Text("Add Item").boldText(AppColors.color293359, 12.sp),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 11.h),
                side: BorderSide(color: AppColors.color293359),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
            SizedBox(height: 99.h),
            DottedLine(
              dashColor: AppColors.colorCCCCCC,
              dashGapLength: 5,
              dashLength: 5,
            ),
            SizedBox(height: 25.h),
            // Service Call Fee
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Service Call Fee",
                  ).regularText(AppColors.color333333, 12.sp),
                ),
                Text("1").regularText(AppColors.color333333, 12.sp),
                Expanded(
                  child: Text("\$50.00").regularText(
                    AppColors.color333333,
                    12.sp,
                    align: TextAlign.end,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Total Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(
                  "Total Amount"
                ).boldText(AppColors.color333333, 16.sp),
                Text(
                  "\$190.00",
                ).boldText(AppColors.color333333, 16.sp),
              ],
            ),
            Expanded(child: SizedBox(height: 100.h)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                GestureDetector(
                  onTap: (){
                   // Get.toNamed(RouteString.estimationOutput);
                  },
                  child: Container(
                      width: 110.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.colorCCCCCC),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Center(
                        child: Text("Restart")
                            .regularText(
                            AppColors.color333333.withValues(alpha: 0.8),
                            14.sp,align: TextAlign.center
                        ),
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (){ AddItemBottomSheet.show(context);
                  },
                  child: Container(
                      width: 110.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.color293359,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Center(
                        child: Text("Save")
                            .boldText(
                            AppColors.white,
                            14.sp,align: TextAlign.center
                        ),
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h)
          ],
        ),
      ),
    );
  }
}
