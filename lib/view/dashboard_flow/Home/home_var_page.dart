import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_dimension.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/view/dashboard_flow/Home/home_page_controller.dart';
import 'package:home_alliance/widgets/image_view.dart';
import 'package:home_alliance/widgets/scroll_behaviour.dart';

import '../../../utils/app_images.dart';
import '../../../utils/route_strings.dart';

class HomeVarPage extends StatelessWidget {
  const HomeVarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (homePageController) {
        return Scaffold(
          backgroundColor: AppColors.colorF5F5F5,
          body: Column(
            children: [
              Container(height: AppDimensions.d35.h),

              Expanded(
                child: ScrollConfiguration(
                  behavior: NoGlowScrollBehavior(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.d10.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15.w),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ImageView(
                                        path: AppImages.icEmptyProfile,
                                        height: AppDimensions.d42.h,
                                        width: AppDimensions.d42.w,
                                        circleCrop: true,
                                      ),
                                      SizedBox(width: 10.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Welcome back,").regularText(
                                            AppColors.color333333,
                                            AppDimensions.d12.sp,
                                          ),
                                          Text("Ralph").boldText(
                                            AppColors.color333333,
                                            AppDimensions.d20.sp,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          Get.toNamed(
                                            RouteString.knowledgeCenterPage,
                                          );
                                        },
                                        child: Container(
                                          height: AppDimensions.d42.h,
                                          width: AppDimensions.d42.w,

                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                              AppDimensions.d100.r,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: ImageView(
                                              path: AppImages.icQuestionMark,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 8),
                                      Stack(
                                        children: [
                                          Container(
                                            height: AppDimensions.d42.h,
                                            width: AppDimensions.d42.w,

                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    AppDimensions.d100.r,
                                                  ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                10.0,
                                              ),
                                              child: ImageView(
                                                path: AppImages.icNotification,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            child: Container(
                                              height: AppDimensions.d10.h,
                                              width: AppDimensions.d10.w,
                                              decoration: BoxDecoration(
                                                color: AppColors.colorDD2E44,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      AppDimensions.d100.r,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              AppSpacing.h20,
                              earnings(homePageController),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _menuItem(
                                    icon: AppImages.icPendingTask,
                                    label: "Invoices",
                                    badgeCount: 2,
                                  ),
                                  _menuItem(
                                    icon: AppImages.icSales,
                                    label: "Sales",
                                    onTap: (){
                                      Get.toNamed(RouteString.salesPipeline);
                                    }
                                  ),
                                  _menuItem(
                                    icon: AppImages.icCompleted,
                                    label: "Completed",
                                  ),
                                  _menuItem(
                                    icon: AppImages.icCancel,
                                    label: "Cancelled",
                                  ),
                                ],
                              ),
                              AppSpacing.h40,
                              // Upcoming Jobs + View All
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Upcoming Jobs (6)").boldText(
                                    AppColors.color333333,
                                    AppDimensions.d14.sp,
                                  ),
                                  Text("View All").regularText(
                                    AppColors.color3332CA,
                                    AppDimensions.d14.sp,
                                  ),
                                ],
                              ),
                              AppSpacing.h10,
                              jobList(homePageController),

                              SizedBox(height: 57.h),
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
      },
    );
  }

  Widget _menuItem({
    required String icon,
    required String label,
    VoidCallback? onTap,
    int badgeCount = 0,
  }) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: onTap ?? () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(19),
                child: ImageView(path: icon),
              ),
            ),
            if (badgeCount > 0)
              Positioned(
                right: -6,
                top: -8,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.colorDD2E44,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "$badgeCount",
                  ).semiBoldText(AppColors.white, AppDimensions.d12.sp),
                ),
              ),
          ],
        ),
        SizedBox(height: 14.h),
        Text(label).semiBoldText(AppColors.color333333, AppDimensions.d12.sp),
      ],
    );
  }

  Widget earnings(HomePageController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.color1F2436, AppColors.color293359],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Daily Earnings",
              ).regularText(AppColors.white, AppDimensions.d14.sp),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                padding: EdgeInsets.all(2),
                child: Row(
                  children: [
                    // Weekly Button
                    GestureDetector(
                      onTap: () {
                        controller.isWeekly = true;
                        controller.update();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: controller.isWeekly
                              ? AppColors.color293359
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        child: Text("Weekly").regularText(
                          controller.isWeekly
                              ? AppColors.white
                              : AppColors.color293359,
                          AppDimensions.d14.sp,
                        ),
                      ),
                    ),
                    // Monthly Button
                    GestureDetector(
                      onTap: () {
                        controller.isWeekly = false;
                        controller.update();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: !controller.isWeekly
                              ? AppColors.color293359
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        child: Text("Monthly").regularText(
                          !controller.isWeekly
                              ? AppColors.white
                              : AppColors.color293359,
                          AppDimensions.d14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Earnings Amount
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "\$ 3,570.00",
              ).boldText(AppColors.white, AppDimensions.d35.sp),
              SizedBox(width: 10.w),
              ImageView(path: AppImages.icUpArrow, height: 34.h),
            ],
          ),
        ],
      ),
    );
  }

  Widget jobList(HomePageController controller) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.jobs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final job = controller.jobs[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon in circle
            Container(
              height: 58,
              padding: EdgeInsets.all(17),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ImageView(
                path: job["icon"],
                color: const Color(0xFF1A2A4A), // navy color
              ),
            ),
            SizedBox(width: 18.w),

            // Job details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job["title"] as String,
                  ).boldText(AppColors.color293359, AppDimensions.d17.sp),
                  SizedBox(height: 5.h),
                  Text(
                    job["time"] as String,
                  ).regularText(AppColors.color333333, AppDimensions.d14.sp),
                  SizedBox(height: 5.h),
                  Text(job["address"] as String).regularText(
                    AppColors.color333333.withValues(alpha: 0.6),
                    AppDimensions.d14.sp,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _updateCard(
    String title,
    String amount,
    String subtitle,
    Color badgeColor,
    int badgeCount,
    String path,
  ) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageView(path: path),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  title,
                ).boldText(AppColors.color333333, AppDimensions.d12),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Text(subtitle).boldText(
            AppColors.color333333.withValues(alpha: 0.8),
            AppDimensions.d10.sp,
          ),
          SizedBox(height: 5.h),
          Text(amount).regularText(
            AppColors.color333333.withValues(alpha: 0.6),
            AppDimensions.d12.sp,
          ),
        ],
      ),
    );
  }
}
