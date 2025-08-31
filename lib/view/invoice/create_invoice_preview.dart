import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_images.dart';
import 'package:home_alliance/view/invoice/create_invoice_preview_controller.dart';
import 'package:home_alliance/widgets/image_view.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_dimension.dart';
import '../../utils/app_spacing.dart';
import '../../widgets/scroll_behaviour.dart';

class CreateInvoicePreview extends StatelessWidget {
  const CreateInvoicePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CreateInvoicePreviewController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ScrollConfiguration(
            behavior: NoGlowScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1F2C6C),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15.w),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Preview",
                                  ).semiBoldText(AppColors.white, AppDimensions.d16.sp),
                                  Icon(Icons.edit,color: AppColors.white,)
                                ],
                              ),
                            ),
                            AppSpacing.h10,

                            Text(
                              "Invoice",
                            ).boldText(AppColors.white, AppDimensions.d30.sp),
                            AppSpacing.h3,
                            const Text(
                                "By Arsen Asatryan "
                            ).regularText(AppColors.white, AppDimensions.d16.sp),
                            AppSpacing.h70,
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: -38.5.h,
                          left: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 39.r, // half of 77
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 34.r, // slightly smaller for inner circle
                              backgroundColor: const Color(0xFF3332CA),
                              child: ImageView(
                                path: AppImages.icInvoice,
                              )
                            ),
                          ))
                    ],
                  ),
                  AppSpacing.h48,
                  // Description Section
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 21.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.updateInvoiceToggle(true);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  color: controller.isInvoice
                                      ? AppColors.primaryDrk
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: controller.getText(
                                  controller.isInvoice,
                                  "Invoice",
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {
                                controller.updateInvoiceToggle(false);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  color: controller.isInvoice
                                      ? AppColors.white
                                      : AppColors.primaryDrk,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: controller.getText(
                                  !controller.isInvoice,
                                  "Job Info",
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.h44,
                        const Text("Description").
                        semiBoldText(AppColors.color333333, AppDimensions.d20.sp),
                        AppSpacing.h10,
                        Divider(color: AppColors.colorCCCCCC),
                        AppSpacing.h16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text("Service Type").semiBoldText(AppColors.color333333,
                                AppDimensions.d14.sp),
                            Text("Appliance Repair").regularText(AppColors.color333333,
                                AppDimensions.d14.sp),
                          ],
                        ),
                        AppSpacing.h20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text("Payment Date").semiBoldText(AppColors.color333333,
                                AppDimensions.d14.sp),
                            Text("May 6th, 2025").regularText(AppColors.color333333,
                                AppDimensions.d14.sp),
                          ],
                        ),
                        AppSpacing.h48,

                        // Table Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Expanded(
                              flex:5,
                              child: Text("Item Service").semiBoldText(AppColors.color333333,
                                  AppDimensions.d14.sp),),

                            Expanded(
                                flex:2,
                                child:Text("Price").semiBoldText(AppColors.color333333,
                                    AppDimensions.d14.sp,align: TextAlign.right)),
                            Expanded(
                                flex:2,child: Text("Qty").semiBoldText(AppColors.color333333,
                                AppDimensions.d14.sp,align: TextAlign.right)),
                            Expanded(
                                flex:3,child:Text("Total").semiBoldText(AppColors.color333333,
                                AppDimensions.d14.sp,align: TextAlign.right)),
                          ],
                        ),
                        AppSpacing.h13,
                        Divider(color: AppColors.colorCCCCCC),
                        AppSpacing.h24,

                        // Row 1
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Expanded(
                              flex:5,
                              child: Row(
                                children: [
                                  ImageView(
                                    path:AppImages.icBox,
                                    height: 24.h,
                                    width: 24.w,),
                                  SizedBox(width: 10.w),
                                  Text("Pipes").regularText(AppColors.color333333,
                                      AppDimensions.d16.sp),
                                ],
                              ),
                            ),
                            Expanded(
                                flex:2,
                                child:Text("\$200").regularText(AppColors.color333333,
                                    AppDimensions.d14.sp,align: TextAlign.right)),
                            Expanded(
                                flex:2,
                                child:Text("2").regularText(AppColors.color333333,
                                    AppDimensions.d14.sp,align: TextAlign.right)),
                            Expanded(
                                flex:3,
                                child: Text("\$200.00").regularText(AppColors.color333333,
                                    AppDimensions.d14.sp,align: TextAlign.right)),
                          ],
                        ),
                        AppSpacing.h30,

                        // Row 2
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Expanded(
                              flex:5,
                              child: Row(
                                children: [
                                  ImageView(
                                    path:AppImages.icTool,
                                    height: 24.h,
                                    width: 24.w,),
                                  SizedBox(width: 10.w),
                                  Text("Repair").regularText(AppColors.color333333,
                                      AppDimensions.d16.sp),
                                ],
                              ),
                            ),
                            Expanded(
                                flex:2,
                                child:Text("\$200").regularText(AppColors.color333333,
                                    AppDimensions.d14.sp,align: TextAlign.right)),
                            Expanded(
                                flex:2,
                                child:Text("1").regularText(AppColors.color333333,
                                    AppDimensions.d14.sp,align: TextAlign.right)),
                            Expanded(
                                flex:3,
                                child: Text("\$200.00").regularText(AppColors.color333333,
                                    AppDimensions.d14.sp,align: TextAlign.right)),
                          ],
                        ),
                        AppSpacing.h30,
                        DottedLine(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 5.0,
                          dashColor: AppColors.colorCCCCCC,
                          dashRadius: 0.0,
                          dashGapLength: 5.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                        AppSpacing.h16,
                        // Total Amount
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text("Total Amount")
                                .boldText(AppColors.color333333,
                                AppDimensions.d16.sp)
                            ,
                            Text("\$600.00") .boldText(AppColors.color333333,
                                AppDimensions.d16.sp),
                          ],
                        ),
                        AppSpacing.h24,


                        // Done Button
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              height: 38.h,
                              width: 110.w,
                              decoration: BoxDecoration(
                                  color: AppColors.color293359,
                                  borderRadius: BorderRadius.circular(5.r)
                              ),
                              child:  Center(
                                child: Text("Done") .boldText(AppColors.white,
                                    AppDimensions.d14.sp),
                              )
                          ),
                        ),
                        AppSpacing.h24,
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
