import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_dimension.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/view/dashboard_flow/Home/home_page_controller.dart';
import 'package:home_alliance/widgets/image_view.dart';

import '../../../utils/app_images.dart';
import '../../../utils/route_strings.dart';
import '../../../widgets/scroll_behaviour.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (homePageController) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                color: AppColors.color293359,
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ImageView(
                              path: AppImages.icDummy,
                              height: AppDimensions.d42.h,
                              width: AppDimensions.d42.w,
                              circleCrop: true,
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Welcome back,").regularText(
                                  AppColors.white,
                                  AppDimensions.d12.sp,
                                ),
                                Text("Ralph").boldText(
                                  AppColors.white,
                                  AppDimensions.d20.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            // GestureDetector(
                            //   behavior: HitTestBehavior.translucent,
                            //   onTap: () {
                            //    Get.toNamed(RouteString.knowledgeCenterPage);
                            //   },
                            //   child: Container(
                            //     height: AppDimensions.d42.h,
                            //     width: AppDimensions.d42.w,
                            //     decoration: BoxDecoration(
                            //       color: AppColors.white,
                            //       borderRadius: BorderRadius.circular(
                            //         AppDimensions.d100.r,
                            //       ),
                            //     ),
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(10.0),
                            //       child: ImageView(
                            //         path: AppImages.icQuestionMark,
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            SizedBox(width: 8),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Get.toNamed(RouteString.notificationsPage);
                              },
                              child: Stack(
                                children: [
                                  Container(
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
                                        borderRadius: BorderRadius.circular(
                                          AppDimensions.d100.r,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                    child: Column(
                      children: [
                        // Top Section
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: double.infinity,
                            //  height: AppDimensions.d219.h,
                              color: AppColors.color293359,
                              padding: EdgeInsets.symmetric(horizontal: 22.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 35.h),
                                  // Earnings & Rating
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Daily Earnings",
                                            ).regularText(
                                              AppColors.white,
                                              AppDimensions.d12.sp,
                                            ),
                                            AppSpacing.h10,
                                            Container(
                                              height: 1.h,
                                              width: 138.w,
                                              color: AppColors.white,
                                            ),
                                            AppSpacing.h20,
                                            SizedBox(
                                              width: 138.w,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text("\$426.00")
                                                        .boldText(
                                                          AppColors.white,
                                                          AppDimensions.d20.sp,
                                                        ),
                                                  ),
                                                  ImageView(
                                                    path: AppImages.icUpArrow,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(flex: 1),
                                      Expanded(
                                        flex: 2,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Avg Job Rating",
                                              ).regularText(
                                                AppColors.white,
                                                AppDimensions.d12.sp,
                                              ),
                                              AppSpacing.h10,
                                              Container(
                                                height: 1.h,
                                                width: 138.w,
                                                color: AppColors.white,
                                              ),
                                              AppSpacing.h20,
                                              SizedBox(
                                                width: 138.w,
                                                child: Row(
                                                  children: [
                                                    Text("4.7").boldText(
                                                      AppColors.white,
                                                      AppDimensions.d20.sp,
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    ImageView(
                                                      path: AppImages.icStar,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 76.h),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: -45.h,
                              left: 22.w,
                              right: 22.w,

                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.d10.r,
                                ),
                                child: Container(
                                  height: 91.h,
                                  width: 350.w,
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppDimensions.d15.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(
                                      AppDimensions.d10.r,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("5").boldText(
                                              AppColors.color333333,
                                              AppDimensions.d30.sp,
                                            ),
                                            SizedBox(width: 10.w),
                                            Text("Jobs for\nthe Day").boldText(
                                              AppColors.color333333,
                                              AppDimensions.d14.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.d1.w,
                                        //    height: AppDimensions.d91.h,
                                        color: AppColors.colorCCCCCC,
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("5").boldText(
                                              AppColors.color333333,
                                              AppDimensions.d30.sp,
                                            ),
                                            SizedBox(width: 10.w),
                                            Text("Jobs\nCompleted").boldText(
                                              AppColors.color333333,
                                              AppDimensions.d14.sp,
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

                        SizedBox(height: 84.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Updates").semiBoldText(
                                AppColors.color333333,
                                AppDimensions.d16.sp,
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  _menuItem(
                                    icon: AppImages.icPendingTask,
                                    label: "Pending\nInvoices",
                                    badgeCount: 2,
                                  ),
                                  _menuItem(
                                      icon: AppImages.icSales,
                                      label: "Open\nJobs",
                                      onTap: (){
                                        Get.toNamed(RouteString.openJobPage);
                                      }
                                  ),
                                  _menuItem(
                                    icon: AppImages.icCompleted,
                                    label: "Upcoming\nJobs",
                                  ),
                                  _menuItem(
                                    icon: AppImages.icCancel,
                                    label: "Cancelled\nJobs",
                                  ),
                                ],
                              ),
                              // Updates Section
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: _updateCard(
                              //         "Open\nInvoices",
                              //         "\$426.00",
                              //         "Total Outstanding",
                              //         Colors.red,
                              //         2,
                              //         AppImages.icPendingTask,
                              //       ),
                              //     ),
                              //     SizedBox(width: 20.w),
                              //     Expanded(
                              //       child: _updateCard(
                              //         "Closed\nInvoices",
                              //         "\$1,578.00",
                              //         "This Week",
                              //         Colors.blue,
                              //         0,
                              //         AppImages.icCompleteTask,
                              //       ),
                              //     ),
                              //   ],
                              // ),

                              SizedBox(height: 57.h),

                              // Today Schedule
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Today's Schedule").boldText(
                                        AppColors.color333333,
                                        AppDimensions.d16.sp,
                                      ),
                                      Spacer(),

                                      DropdownButton<String>(
                                        value:
                                            homePageController.selectedFilter,
                                        underline: const SizedBox(),
                                        isDense: true,
                                        icon:
                                            SizedBox.shrink(), // <-- Hides the default arrow
                                        items: homePageController.filterOptions
                                            .map(
                                              (e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e).regularText(
                                                  AppColors.color333333,
                                                  AppDimensions.d16.sp,
                                                  align: TextAlign.right,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) {
                                          homePageController.selectedFilter =
                                              value!;
                                          homePageController.update();
                                        },
                                        selectedItemBuilder: (context) {
                                          return homePageController
                                              .filterOptions
                                              .map((e) {
                                                return SizedBox(
                                                  width:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width /
                                                      3,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(e).regularText(
                                                        AppColors.color333333,
                                                        AppDimensions.d16.sp,
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      ImageView(
                                                        path: AppImages
                                                            .icDownArrow,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              })
                                              .toList();
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15.h),
                                  // Timeline item
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 15.h,
                                            width: 15.w,
                                            decoration: BoxDecoration(
                                              color: AppColors
                                                  .primaryDrk, // dark blue dot
                                              shape: BoxShape.circle,
                                            ),
                                          ),


                                          SizedBox(width: 20.w),
                                          const Text("8:00 AM").boldText(
                                            AppColors.color333333,
                                            AppDimensions.d12.sp,
                                          ),
                                        ],
                                      ),
                                      AppSpacing.h10,
                                      IntrinsicHeight(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            // Vertical Line
                                            SizedBox(
                                              width: 15.w,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 6.5.w),
                                                child: Container(
                                                  width: 2.w,
                                                  color: AppColors.colorD9D9D9,
                                                ),
                                              ),
                                            ),

                                            SizedBox(width: 18.w),

                                            // Right Side Card
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 11.w,
                                                    vertical: 17.h,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(10.r),
                                                    border: Border.all(
                                                      color: AppColors.colorCCCCCC,
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.withOpacity(0.1),
                                                        blurRadius: 5,
                                                        offset: const Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      // Status Chip
                                                      Container(
                                                        padding: EdgeInsets.symmetric(
                                                          horizontal: 10.w,
                                                          vertical: 6.h,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color: AppColors.colorFFC917,
                                                          borderRadius: BorderRadius.circular(20.r),
                                                        ),
                                                        child: const Text("IN PROGRESS").regularText(
                                                          AppColors.color333333,
                                                          AppDimensions.d10.sp,
                                                        ),
                                                      ),
                                                      SizedBox(height: 20.h),

                                                      const Text("APPLIANCE REPAIR").boldText(
                                                        AppColors.color333333,
                                                        AppDimensions.d20.sp,
                                                      ),

                                                      SizedBox(height: 10.h),
                                                      const Text("John Doe").semiBoldText(
                                                        AppColors.color333333,
                                                        AppDimensions.d15.sp,
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      getDes("(555) 123-4567"),
                                                      SizedBox(height: 10.h),
                                                      getDes("4118 Davana Rd, Los Angeles, CA"),
                                                      SizedBox(height: 10.h),
                                                      const Text("Job description & Special notes").semiBoldText(
                                                        AppColors.color333333,
                                                        AppDimensions.d15.sp,
                                                      ),
                                                      SizedBox(height: 10.h),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: TextStyle(  // 👈 Base style for all spans
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: AppDimensions.d15.sp,
                                                        fontFamily: "Inter",
                                                        color: AppColors.color333333,
                                                      ),
                                                      children: [
                                                        const TextSpan(
                                                          text: "Fixing the refrigerator not cooling. ",
                                                        ),
                                                        TextSpan(
                                                          text: "Customer",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold, // 👈 Only override weight here
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: " requested the repair to be done before 2 PM.",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                      SizedBox(height: 10.h),
                                                      const Text("Previous Service History").semiBoldText(
                                                        AppColors.color333333,
                                                        AppDimensions.d15.sp,
                                                      ),
                                                      SizedBox(height: 10.h),
                                                       getDes("No Prior services found"),
                                                      SizedBox(height: 10.h),
                                                      const Text("Sales Breakdown").semiBoldText(
                                                        AppColors.color333333,
                                                        AppDimensions.d15.sp,
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      getDes("No sales data available"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      AppSpacing.h10,
                                    ],
                                  ),
                                ],
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
      },
    );
  }

  getDes(String text ){
    return RichText(
      text: TextSpan(
        style: TextStyle(  // 👈 Base style for all spans
          fontWeight: FontWeight.w400,
          fontSize: AppDimensions.d15.sp,
          fontFamily: "Inter",
          color: AppColors.color333333,
        ),
        children: [
          TextSpan(
            text: text,
          ),
        ],
      ),
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
                  border: BoxBorder.all(color: AppColors.color333333.withValues(alpha: 0.2)),
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
                  ).semiBoldText(AppColors.white, AppDimensions.d12.sp,),
                ),
              ),
          ],
        ),
        SizedBox(height: 14.h),
        Text(label).semiBoldText(AppColors.color333333, AppDimensions.d12.sp,align: TextAlign.center),
      ],
    );
  }
  Widget _statCard(String value, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
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
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.colorCCCCCC),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
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
        ),
        if (badgeCount > 0)
          Positioned(
            right: 2,
            top: -2,
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
    );
  }
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String selectedFilter = "All";
  final List<String> filterOptions = ["All", "Pending", "Complete"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Today's Schedule",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: selectedFilter,
                  underline: const SizedBox(),
                  items: filterOptions
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFilter = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Timeline item
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline with dot + line
                Column(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xFF002855), // dark blue dot
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: 60, // bar length between 8 and 9
                      width: 2,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                const SizedBox(width: 10),

                // Time + Card
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "8:00 AM",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.yellow.shade700,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "IN PROGRESS",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "APPLIANCE REPAIR",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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
}
