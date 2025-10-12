import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/helper/common_widgets.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/widgets/scroll_behaviour.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_dimension.dart';
import '../../utils/app_images.dart';
import '../../widgets/image_view.dart';

class SalesPipeline extends StatelessWidget {
  const SalesPipeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppSpacing.h60,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.5.h),
            child: CommonWidgets.appBar("Sales Pipeline"),
          ),
          AppSpacing.h10,
          Expanded(
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.h14,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 20.h,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.color1F2436,
                                  AppColors.color293359,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title Row
                                    Text("Jobs Approved Today").regularText(
                                      AppColors.white,
                                      AppDimensions.d13.sp,
                                    ),
                                    SizedBox(height: 10.h),
                                    Text("2").boldText(
                                      AppColors.white,
                                      AppDimensions.d15.sp,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title Row
                                    Text("Pending Payments").regularText(
                                      AppColors.white,
                                      AppDimensions.d13.sp,
                                    ),
                                    SizedBox(height: 10.h),
                                    Text("\$1040.00").boldText(
                                      AppColors.white,
                                      AppDimensions.d15.sp,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          AppSpacing.h24,

                          Text("Recent Activity").boldText(
                            AppColors.color333333,
                            AppDimensions.d16.sp,
                          ),
                        ],
                      ),
                    ),
                    PipelineWidget(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pipeline Summary").boldText(
                            AppColors.color333333,
                            AppDimensions.d16.sp,
                          ),
                          AppSpacing.h10,
                          _summaryCard(
                            icon: AppImages.icPhInvoice,
                            count: "4",
                            label: "Estimates Sent ",
                              time: "Today",
                          ),
                          _summaryCard(
                            icon: AppImages.icTaskApproved,
                            count: "2",
                            label: "Jobs Approved ",
                            time: "Today",
                          ),
                          _summaryCard(
                            icon: AppImages.icCalendarC,
                            count: "7",
                            label: "Total Jobs",
                            time: "Scheduled",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryCard({
    required String icon,
    required String count,
    required String label,
    required String time,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.colorCCCCCC),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
         ImageView(
           path: icon,
         ),
          SizedBox(width: 10.w),
          Text(
            count,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
          ).boldText(AppColors.color333333, 40.sp),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label
                ).regularText(AppColors.color333333, 16.sp),
                Text(
                  time
                ).regularText(AppColors.color333333, 16.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PipelineWidget extends StatelessWidget {
  const PipelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> estimates = [
      {
        "status": "Estimate Sent",
        "color": AppColors.color6F6EFF,
        "name": "John Miller",
        "amount": "\$1,200",
        "date": "May 16, 2025",
      },
      {
        "status": "Approved Quote",
        "color": AppColors.color34A853,
        "name": "Kaydae",
        "amount": "\$450",
        "date": "May 16, 2025",
      },
      {
        "status": "Estimate Sent",
        "color": AppColors.color6F6EFF,
        "name": "Robert Fox",
        "amount": "\$890",
        "date": "May 15, 2025",
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 21.5.w),
          child: Row(
            children: List.generate(estimates.length, (index) {
              final estimate = estimates[index];
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: _estimateCard(
                  title: estimate['status'],
                  name: estimate['name'],
                  amount: estimate['amount'],
                  date: estimate['date'],
                  color: estimate['color'],
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 24.h),

        // Pipeline Summary Cards
      ],
    );
  }

  Widget _estimateCard({
    required String title,
    required String name,
    required String amount,
    required String date,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: 21.h,
        bottom: 21.h,
        left: 15.w,
        right: 50.w,
      ),
      // width: 228.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.colorCCCCCC),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Tag
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(title).regularText(AppColors.white, 14.sp),
          ),
          SizedBox(height: 10.h),
          Text(name).boldText(AppColors.color333333, 30.sp),
          SizedBox(height: 10.h),
          Text(amount).regularText(AppColors.color333333, 16.sp),
          SizedBox(height: 25.h),
          Text(date).regularText(AppColors.color333333, 16.sp),
        ],
      ),
    );
  }
}
