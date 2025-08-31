import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/helper/routes.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/utils/route_strings.dart';
import 'package:home_alliance/view/dashboard_flow/jobs/jobs_controller.dart';
import 'package:home_alliance/widgets/image_view.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utils/app_images.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  int selectedTab = 0; // 0 = Open Jobs, 1 = Closed Jobs

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobController>(
      builder: (jobController) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.all(21.5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15.w),
                // Stats
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Top Gradient Container
                    Container(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryDrk,
                            AppColors.primaryLight,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          AppSpacing.h44,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildStat("1", "Today's\nJobs"),
                              _buildStat("2", "Jobs\nCompleted"),
                            ],
                          ),
                          AppSpacing.h80,
                          // Extra spacing so the stack has enough height
                          SizedBox(height: 60.h),
                        ],
                      ),
                    ),

                    // Floating White Action Container
                    Positioned(
                      bottom: -45.5, // float outside
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.5.w),
                        child: Container(
                          width: 313.w,
                          height: 91.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: AppColors.colorCCCCCC),
                          ),
                          child: Row(
                            children: [
                              // First tappable section
                              Expanded(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque, // full area clickable
                                  onTap: () {
                                    Get.toNamed(RouteString.createInvoicePage);
                                  },
                                  child: Container(
                                    height: double.maxFinite,
                                    color: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.h,
                                      horizontal: 16.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ImageView(path: AppImages.icSales),
                                        AppSpacing.w20,
                                        Text(
                                          "Create\nInvoice",
                                          textAlign: TextAlign.center,
                                        ).boldText(
                                          AppColors.color333333,
                                          AppDimensions.d14.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // Divider
                              Container(
                                height: 60.h,
                                width: 1.w,
                                color: AppColors.colorCCCCCC,
                              ),

                              // Second tappable section
                              Expanded(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    Get.toNamed(RouteString.aiEstimation);
                                  },
                                  child: Container(
                                    height: double.maxFinite,
                                    color: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.h,
                                      horizontal: 16.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ImageView(path: AppImages.icEstimate),
                                        AppSpacing.w20,
                                        Text(
                                          "Estimate\nCreation",
                                          textAlign: TextAlign.center,
                                        ).boldText(
                                          AppColors.color333333,
                                          AppDimensions.d14.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 94.h),

                // Calendar
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.r),
                      bottomRight: Radius.circular(8.r),
                    ),
                    border: Border.all(
                      color: AppColors.color9A9A9A,
                      width: 0.92.w,
                    ),
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },

                    // Header Style
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.sp,
                        color: AppColors.color333333.withValues(alpha: 0.87),
                        fontWeight: FontWeight.bold,
                      ),
                      titleCentered: true,
                    ),

                    // Weekday names style
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: const TextStyle(
                        color: Color(0xFFA5A5A5), // Weekday color
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      weekendStyle: const TextStyle(
                        color: Color(
                          0xFFA5A5A5,
                        ), // Weekend color same as weekdays
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // Calendar Style
                    calendarStyle: CalendarStyle(
                      selectedTextStyle: TextStyle(
                        color: AppColors.color333333, // Dates color
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      defaultTextStyle: TextStyle(
                        color: AppColors.colorACACAC, // Dates color
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      outsideTextStyle: TextStyle(
                        color: AppColors.colorE2E2E2, // Dates color
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      weekendTextStyle: const TextStyle(
                        color: AppColors.colorACACAC, // Dates color
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      todayTextStyle: const TextStyle(
                        color: AppColors.colorACACAC, // Dates color
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AppColors.colorD9EFFE,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                    ),

                    // Adjust row height (vertical spacing)
                    rowHeight: 35.h,

                    // Horizontal spacing between days
                    daysOfWeekHeight: 30.h,
                  ),
                ),

                SizedBox(height: 40.h),

                // Tabs
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = 0),
                        child: Column(
                          children: [
                            Text(
                              "Open Jobs (6)",
                              style: TextStyle(
                                fontWeight: selectedTab == 0
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: selectedTab == 0
                                    ? AppColors.color293359
                                    : AppColors.color333333,
                                fontSize: 14.sp,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16.h),
                              height: selectedTab == 0 ? 3.h : 1.h,
                              color: selectedTab == 0
                                  ? AppColors.color293359
                                  : AppColors.colorCCCCCC,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = 1),
                        child: Column(
                          children: [
                            Text(
                              "Closed Jobs (3)",
                              style: TextStyle(
                                fontWeight: selectedTab == 1
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: selectedTab == 1
                                    ? AppColors.color293359
                                    : AppColors.color333333,
                                fontSize: 14.sp,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16.h),
                              height: selectedTab == 1 ? 3.h : 1.h,
                              color: selectedTab == 1
                                  ? AppColors.color293359
                                  : AppColors.colorCCCCCC,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26.h),
                Row(
                  children: [
                    Text("Mon, May 14").boldText(AppColors.color333333, 14.sp),
                    Spacer(),
                    DropdownButton<String>(
                      value: jobController.selectedFilter,
                      underline: const SizedBox(),
                      isDense: true,
                      icon: SizedBox.shrink(), // <-- Hides the default arrow
                      items: jobController.filterOptions
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e).regularText(
                                AppColors.color333333.withValues(alpha: 0.6),
                                AppDimensions.d14.sp,
                                align: TextAlign.right,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        jobController.selectedFilter = value!;
                        jobController.update();
                      },
                      selectedItemBuilder: (context) {
                        return jobController.filterOptions.map((e) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(e).regularText(
                                  AppColors.color333333.withValues(alpha: 0.6),
                                  AppDimensions.d14.sp,
                                ),
                                AppSpacing.w5,
                                ImageView(
                                  path: AppImages.icDownArrow,
                                  color: AppColors.color333333.withValues(
                                    alpha: 0.6,
                                  ),
                                  height: 10.h,
                                  width: 30.w,
                                ),
                              ],
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
                AppSpacing.h20,
                Row(
                  children: [
                    Text("8:00 PM").boldText(AppColors.color333333, 12.sp),
                    SizedBox(width: 10.w),
                    Container(
                      height: 15.h,
                      width: 15.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.color293359,
                      ),
                    ),
                    AppSpacing.w20,
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteString.openJobPage);
                      },
                      child: Container(
                        height: 19,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          // vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: const Text(
                            "IN PROGRESS",
                          ).regularText(AppColors.color333333, 10.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStat(String number, String label) {
    return Row(
      children: [
        Text(number).semiBoldText(AppColors.white, AppDimensions.d60.sp),
        SizedBox(width: 10.w),
        Text(label).regularText(AppColors.white, AppDimensions.d16.sp),
      ],
    );
  }
}
