import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:home_alliance/utils/app_extensions.dart';

import '../../../helper/shared_prefs.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_spacing.dart';
import '../../../utils/route_strings.dart';
import '../../../widgets/image_view.dart';
import '../../../widgets/scroll_behaviour.dart';
import '../../open_job/open_job.dart';
import 'home_page_controller.dart';

class NewHomePage extends StatelessWidget {
  const NewHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (homePageController) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                // color: AppColors.color293359,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteString.profileScreen);
                              },
                              child: ImageView(
                                path: AppImages.icDummy,
                                height: AppDimensions.d42.h,
                                width: AppDimensions.d42.w,
                                circleCrop: true,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Welcome back,").regularText(
                                  AppColors.color555555,
                                  AppDimensions.d12.sp,
                                ),
                                Text(
                                  SharedPrefs.prefs?.getString(
                                        SharedPrefs.userName,
                                      ) ??
                                      "Ralph",
                                ).boldText(
                                  AppColors.color555555,
                                  AppDimensions.d20.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(RouteString.rewardsScreen);
                          },
                          child: Container(
                            height: AppDimensions.d42.h,
                            width: AppDimensions.d42.w,

                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: BoxBorder.all(color: AppColors.colorD9D9D9),
                              borderRadius: BorderRadius.circular(
                                AppDimensions.d8.r,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: ImageView(path: AppImages.icReward),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: NoGlowScrollBehavior(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 32.h,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildInfoCard(
                                title: 'Today’s Jobs',
                                subtitle: '3 jobs',
                                iconPath: AppImages.icBriefcase,
                              ),
                              buildInfoCard(
                                title: 'Open Jobs',
                                subtitle: '1 job',
                                iconPath: AppImages.icNotes,
                              ),
                              buildInfoCard(
                                title: 'Closed Jobs',
                                subtitle: '120 jobs',
                                iconPath: AppImages.icOpenFolder,
                              ),
                            ],
                          ),

                          SizedBox(height: 32.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Your NPS").semiBoldText(
                                    AppColors.color555555,
                                    AppDimensions.d16.sp,
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      Get.toNamed(RouteString.yourNpsScreen);
                                    },
                                    child: ImageView(path: AppImages.icQMark),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              // ---------- NPS Boxes ----------
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _npsBox("All", "0"),
                                  AppSpacing.w16,
                                  _npsBox("90 Days", "0"),
                                  AppSpacing.w16,
                                  _npsBox("30 Days", "0"),
                                ],
                              ),

                              AppSpacing.h32,
                              // Today Schedule
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Today's Schedule").semiBoldText(
                                        AppColors.color333333,
                                        AppDimensions.d16.sp,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  const Text("October 26, 2025").regularText(
                                    AppColors.color949494,
                                    AppDimensions.d12.sp,
                                  ),
                                  SizedBox(height: 24.h),

                                  /// jobs list
                                  ListView.builder(
                                    itemCount: 6,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                          return getJobsWidget(index);
                                        },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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

  getJobsWidget(int index) {
    bool hide = index.isOdd;
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteString.jobInfo);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hide ? "12:00pm" : "9:00am",
                ).regularText(AppColors.color949494, AppDimensions.d11.sp),
                AppSpacing.w16,
                Column(
                  children: [
                    Container(
                      height: 18.h,
                      width: 18.w,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.color293359.withValues(alpha: 0.5),
                          width: 0.5.w,
                        ),
                      ),
                      child: hide
                          ? Container(
                              height: 8.h,
                              width: 8.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: AppColors.color293359.withValues(
                                    alpha: 0.5,
                                  ),
                                  width: 1.w,
                                ),
                              ),
                            )
                          : AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.color293359,
                              ),
                            ),
                    ),
                    AppSpacing.h14,
                    Container(
                      margin: EdgeInsets.only(top: 5.r),
                      width: AppDimensions.d2.w,
                      height: AppDimensions.d65.h,

                      decoration: BoxDecoration(
                        color: AppColors.colorF5F5F5,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ],
                ),
                AppSpacing.w24,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Preventive Maintenance HVAC",
                      ).boldText(AppColors.color555555, AppDimensions.d13.sp),
                      AppSpacing.h14,
                      blurredText(
                        Text("4118 Davana Rd, Los Angeles, CA").regularText(
                          AppColors.color949494,
                          AppDimensions.d13.sp,
                        ),
                        hide: hide,
                      ),
                      AppSpacing.h6,
                      blurredText(
                        Row(
                          children: [
                            ImageView(path: AppImages.icLocation),
                            Text("25km away").regularText(
                              AppColors.color333333.withValues(alpha: 0.8),
                              AppDimensions.d13.sp,
                            ),
                          ],
                        ),
                        hide: hide,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getDes(String text) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          // 👈 Base style for all spans
          fontWeight: FontWeight.w400,
          fontSize: AppDimensions.d15.sp,
          fontFamily: "Inter",
          color: AppColors.color333333,
        ),
        children: [TextSpan(text: text)],
      ),
    );
  }

  Widget blurredText(Widget dataWidget, {double blur = 3, required bool hide}) {
    return ClipRect(
      child: Stack(
        children: [
          dataWidget,
          if (hide)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: Container(color: Colors.transparent),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildInfoCard({
    required String title,
    required String subtitle,
    required String iconPath,
  }) {
    return Container(
      height: AppDimensions.d140.h,
      width: AppDimensions.d110.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.colorD9D9D9),
        borderRadius: BorderRadius.circular(AppDimensions.d8.r),
      ),
      padding: EdgeInsets.only(left: AppDimensions.d8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.h16,
          Text(title).boldText(AppColors.color333333, AppDimensions.d12.sp),
          AppSpacing.h5,
          Text(
            subtitle,
          ).regularText(AppColors.color333333, AppDimensions.d10.sp),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              ImageView(path: iconPath),
            ],
          ),
        ],
      ),
    );
  }

  // ---------- NPS Box ----------
  Widget _npsBox(String label, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 19.h, bottom: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.colorD9D9D9),
        ),
        child: Column(
          children: [
            Text(value).boldText(AppColors.color555555, AppDimensions.d24),
            SizedBox(height: 10.h),
            Text(label).regularText(AppColors.color949494, AppDimensions.d12),
          ],
        ),
      ),
    );
  }

  // ---------- Schedule Item ----------
  Widget _scheduleItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time + Dot
          Column(
            children: [
              Text(
                "9:00am",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade700),
              ),
              SizedBox(height: 4.h),
              Icon(
                Icons.radio_button_checked,
                size: 16.sp,
                color: Colors.grey.shade600,
              ),
            ],
          ),
          SizedBox(width: 12.w),

          // Job Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Preventive Maintenance HVAC",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "4118 Davana Rd, Los Angeles, CA",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    // Icon(
                    //   FontAwesomeIcons.locationDot,
                    //   size: 12.sp,
                    //   color: Colors.grey.shade600,
                    // ),
                    SizedBox(width: 6.w),
                    Text(
                      "25km away",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
