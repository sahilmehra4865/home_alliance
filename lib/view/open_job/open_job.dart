import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_images.dart';
import 'package:home_alliance/view/open_job/open_job_page_controller.dart';
import 'package:home_alliance/widgets/image_view.dart';
import 'package:home_alliance/widgets/scroll_behaviour.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_dimension.dart';
import '../../utils/app_spacing.dart';

class OpenJobPage extends StatelessWidget {
  final String jobId;
  const OpenJobPage({super.key, required this.jobId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OpenJobPageController>(
      initState: (_) {
        // ✅ When the screen loads, initialize the controller with the jobId
        final controller = Get.find<OpenJobPageController>();
        controller.initWithJobId(jobId);
      },

      builder: (controller) {
        return Scaffold(
          body: controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : controller.jobDetailResponse == null
              ? Column(
                  children: [
                    SizedBox(height: 55.w),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CommonWidgets.appBar("Back"),
                    ),
                    Expanded(child: Center(child: Text("No job found!").semiBoldText(AppColors.color333333, AppDimensions.d15.sp))),
                    SizedBox(height: 70.w),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(height: 55.w),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CommonWidgets.appBar(
                        "Back",
                        suffix: (controller.jobDetailResponse?.job?.status ?? "").toLowerCase() == "completed"
                            ? Container()
                            : Container(
                                height: 32.h,
                                width: 111.w,
                                decoration: BoxDecoration(color: AppColors.colorFF4747, borderRadius: BorderRadius.circular(5.r)),
                                child: Center(child: Text("CLOSE JOB").boldText(AppColors.white, 14.sp)),
                              ),
                      ),
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: NoGlowScrollBehavior(),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSpacing.h32,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Job Title
                                  Expanded(
                                    child: Text(
                                      controller.jobDetailResponse?.job?.department ?? "",
                                    ).semiBoldText(AppColors.color333333, 20.sp),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 7.5.h),
                                      decoration: BoxDecoration(
                                        color: (controller.jobDetailResponse?.job?.status ?? "").toLowerCase() == "completed"
                                            ? AppColors.color34A853
                                            : AppColors.colorFFC917,
                                        borderRadius: BorderRadius.circular(20.r),
                                      ),
                                      child: Text(controller.jobDetailResponse?.job?.status ?? "").boldText(AppColors.color333333, 10.sp),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 5.h),
                              Text(
                                "Job #${(controller.jobDetailResponse?.job?.reference ?? "")}",
                              ).regularText(AppColors.color333333, 14.sp),
                              SizedBox(height: 7.h),
                              Row(
                                children: [
                                  Container(
                                    height: 7.h,
                                    width: 7.w,
                                    decoration: BoxDecoration(color: AppColors.color293359, shape: BoxShape.circle),
                                  ),
                                  SizedBox(width: 7.w),
                                  Text("Organic Lead").regularText(AppColors.color293359, 14.sp),
                                ],
                              ),
                              SizedBox(height: 40.h),

                              // Appointment Section
                              sectionTitle("Appointment"),
                              divider(),
                              detailRow("Type of Service:", controller.jobDetailResponse?.job?.service ?? ""),
                              detailRow("Location:", controller.jobDetailResponse?.job?.location ?? ""),

                              SizedBox(height: 32.h),

                              // Customer Info
                              sectionTitle("Customer Info"),
                              divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.jobDetailResponse?.job?.customer?.name ?? "",
                                      ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 16.sp),
                                      SizedBox(height: 5.h),
                                      Text(
                                        controller.jobDetailResponse?.job?.customer?.date ?? "",
                                      ).regularText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ImageView(path: AppImages.icChat),
                                      AppSpacing.w20,
                                      ImageView(path: AppImages.icPhone),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.h),
                              Text(
                                "+${controller.jobDetailResponse?.job?.customer?.phone ?? ""}",
                              ).regularText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
                              SizedBox(height: 5.h),
                              if (controller.jobDetailResponse?.job?.customer?.email != null)
                                Text(
                                  controller.jobDetailResponse?.job?.customer?.email ?? "",
                                ).regularText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),

                              SizedBox(height: 30.h),
                              detailRow("Location:", controller.jobDetailResponse?.job?.customer?.location ?? ""),

                              SizedBox(height: 10.h),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: ImageView(path: AppImages.icDMap),
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
      },
    );
  }

  Widget sectionTitle(String title) {
    return Text(title).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp);
  }

  Widget divider() {
    return Column(
      children: [
        AppSpacing.h10,
        Container(height: 1.h, width: double.maxFinite, color: AppColors.colorCCCCCC),
        AppSpacing.h10,
      ],
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 120.w, child: Text(title).regularText(AppColors.color333333.withValues(alpha: 0.8), 14.sp)),
          Expanded(child: Text(value).regularText(AppColors.color333333.withValues(alpha: 0.8), 14.sp)),
        ],
      ),
    );
  }
}
