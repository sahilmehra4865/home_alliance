import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_dimension.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_images.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/widgets/image_view.dart';
import 'package:home_alliance/widgets/scroll_behaviour.dart';

import '../../../helper/common_widgets.dart';
import 'metrics_page_controller.dart';

class MetricsPage extends StatelessWidget {
  const MetricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MetricsPageController>(
      builder: (metricsPageController) {
        return Scaffold(
          body: ScrollConfiguration(
            behavior: NoGlowScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.5.h),
                    child: Column(
                      children: [
                        CommonWidgets.appBar(
                          "performance_metrics",
                          suffix: ImageView(path: AppImages.icSettings),
                        ),
                        AppSpacing.h32,
                        ProfileCard(),
                        AppSpacing.h32,
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                metricsPageController.updateSelectType(0);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  color: metricsPageController.selectType == 0
                                      ? AppColors.primaryDrk
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: metricsPageController.getText(
                                  metricsPageController.selectType == 0,
                                  "Progress",
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                metricsPageController.updateSelectType(1);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  color: metricsPageController.selectType == 1
                                      ? AppColors.primaryDrk
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: metricsPageController.getText(
                                  metricsPageController.selectType == 1,
                                  "KPI",
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                metricsPageController.updateSelectType(2);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  color: metricsPageController.selectType == 2
                                      ? AppColors.primaryDrk
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: metricsPageController.getText(
                                  metricsPageController.selectType == 2,
                                  "Reviews",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.h16,
                  // Chart Card
                  if (metricsPageController.selectType == 1) ...{
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 21.5.w),
                      child: Row(
                        children: List.generate(
                          3,
                              (index) => WeeklyGoalCard(progress: 0.51),
                        ),
                      ),
                    )
                  },
                  if (metricsPageController.selectType == 2) ...{
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 21.5.w),
                      child: Row(
                        children: List.generate(
                          3,
                              (index) => ReviewCard(),
                        ),
                      ),
                    )

                  },

                  if (metricsPageController.selectType == 0)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.5.w),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: BoxBorder.all(color: AppColors.colorF5F5F5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSpacing.h24,
                            Row(
                              children: [
                                Text("Jobs Statistics").boldText(
                                  AppColors.color333333,
                                  AppDimensions.d15.sp,
                                ),
                                Spacer(),
                                Container(
                                  height: 7.h,
                                  width: 7.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.color293359,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                AppSpacing.w5,
                                Text("This Week").regularText(
                                  AppColors.color333333,
                                  AppDimensions.d11.sp,
                                ),
                                AppSpacing.w15,
                                Container(
                                  height: 7.h,
                                  width: 7.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.color9CABE2,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                AppSpacing.w5,
                                Text("Last Week").regularText(
                                  AppColors.color333333,
                                  AppDimensions.d11.sp,
                                ),
                              ],
                            ),
                            AppSpacing.h30,

                            SizedBox(
                              height: 200,
                              child: _BarChart(metricsPageController),
                            ),

                            SizedBox(height: 25.h),
                            Row(
                              children: [
                                Container(
                                  height: 7.h,
                                  width: 7.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.color9CABE2,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                AppSpacing.w4,
                                Text("Last Week Total: ").regularText(
                                  AppColors.black,
                                  AppDimensions.d10.sp,
                                ),
                                Text("\$880").boldText(
                                  AppColors.black,
                                  AppDimensions.d10.sp,
                                ),
                                AppSpacing.w20,
                                Text("This Week Total: ").regularText(
                                  AppColors.black,
                                  AppDimensions.d10.sp,
                                ),
                                Text("\$1,256").boldText(
                                  AppColors.black,
                                  AppDimensions.d10.sp,
                                ),
                                AppSpacing.w4,
                                Icon(
                                  Icons.keyboard_arrow_up,
                                  color: AppColors.color34A853,
                                  opticalSize: 10,
                                  grade: 10,
                                  weight: 10,
                                  size: 18,
                                ),
                              ],
                            ),

                            AppSpacing.h10,
                          ],
                        ),
                      ),
                    ),
                  AppSpacing.h30,
                  // Tabs
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.5.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  metricsPageController.updateSelectTab(0);
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "Badges",
                                      style: TextStyle(
                                        fontWeight:
                                            metricsPageController.selectedTab ==
                                                0
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                        color:
                                            metricsPageController.selectedTab ==
                                                0
                                            ? AppColors.color293359
                                            : AppColors.color333333,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 16.h),
                                      height:
                                          metricsPageController.selectedTab == 0
                                          ? 3.h
                                          : 1.h,
                                      color:
                                          metricsPageController.selectedTab == 0
                                          ? AppColors.color293359
                                          : AppColors.colorCCCCCC,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  metricsPageController.updateSelectTab(1);
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "Leaderboard",
                                      style: TextStyle(
                                        fontWeight:
                                            metricsPageController.selectedTab ==
                                                1
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                        color:
                                            metricsPageController.selectedTab ==
                                                1
                                            ? AppColors.color293359
                                            : AppColors.color333333,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 16.h),
                                      height:
                                          metricsPageController.selectedTab == 1
                                          ? 3.h
                                          : 1.h,
                                      color:
                                          metricsPageController.selectedTab == 1
                                          ? AppColors.color293359
                                          : AppColors.colorCCCCCC,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.h24,
                        MilestoneCard(
                          icon: AppImages.icFlag,
                          title: "100 Jobs Milestone",
                          subtitle: "Be consistently active for 5 days",
                        ),
                        MilestoneCard(
                          icon: AppImages.icHeart,
                          title: "Customer Favorite",
                          subtitle: "Be consistently active for 5 days",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Profile Row
        Row(
          children: [
            // Profile Image
            Container(
              height: 86.h,
              width: 86.w,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ImageView(path: AppImages.icDummy),
            ),
            SizedBox(width: 12.w),

            // Name & Joined Date
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Arsen Asatryan",
                ).boldText(AppColors.color333333, 20.sp),
                SizedBox(height: 10.h),
                Text("Joined April 22, 2022").regularText(
                  AppColors.color333333.withValues(alpha: 0.6),
                  12.sp,
                ),
                SizedBox(height: 10.h),

                // Gold Rank Badge
                Container(
                  //height: 23.h,
                  //  width: 100.w,
                  padding: EdgeInsets.symmetric(
                    vertical: 3.5.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageView(path: AppImages.icCoin),
                        SizedBox(width: 8.w),
                        Text(
                          "GOLD RANK",
                          style: TextStyle(
                            fontFamily: "Inria Sans",
                            color: AppColors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.h),

        /// Stats Row
        Row(
          children: [
            // Jobs Completed
            Row(
              children: [
                Container(
                  height: 37.h,
                  width: 37.w,
                  decoration: BoxDecoration(
                    color: AppColors.colorF5F5F5,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ImageView(path: AppImages.icCheckFill),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("2,012").boldText(AppColors.color333333, 15.sp),
                    AppSpacing.h6,
                    Text("Jobs Completed").regularText(
                      AppColors.color333333.withValues(alpha: 0.8),
                      11.sp,
                    ),
                  ],
                ),
              ],
            ),
            AppSpacing.w30,
            // Avg Job Rating
            Row(
              children: [
                Container(
                  height: 37.h,
                  width: 37.w,
                  decoration: BoxDecoration(
                    color: AppColors.colorF5F5F5,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ImageView(
                      path: AppImages.icStar,
                      color: AppColors.color3332CA,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("4.7").boldText(AppColors.color333333, 15.sp),
                    AppSpacing.h6,
                    Text("Avg Job Rating").regularText(
                      AppColors.color333333.withValues(alpha: 0.8),
                      11.sp,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _BarChart extends StatelessWidget {
  final MetricsPageController controller;
  const _BarChart(this.controller);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 50, // fix max Y axis
        alignment: BarChartAlignment.spaceAround,
        barGroups: [
          makeGroup(0, 14, 20),
          makeGroup(1, 7, 5),
          makeGroup(2, 12, 34),
          makeGroup(3, 24, 44),
          makeGroup(4, 34, 23),
          makeGroup(5, 34, 34),
          makeGroup(6, 34, 42),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 10,
              getTitlesWidget: (value, meta) {
                String text;
                if (value == 0) {
                  text = "0";
                } else if (value >= 1000) {
                  text =
                      "${(value / 1000).toStringAsFixed(value % 1000 == 0 ? 0 : 1)}k";
                } else {
                  text = value.toInt().toString();
                }

                return Text(
                  text,
                  style: TextStyle(
                    color: AppColors.color333333,
                    fontSize: 12.sp,
                  ),
                );
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    days[value.toInt()],
                    style: TextStyle(
                      color: AppColors.color333333,
                      fontSize: 12.sp,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 10,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: AppColors.bgLight, strokeWidth: 1);
          },
        ),
        // ✅ Force line at 2000
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: 50,
              color: AppColors.bgLight,
              strokeWidth: 1,

              //  dashArray: [5, 0],
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroup(int x, double y1, double y2) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y1, color: AppColors.color293359, width: 9),
        BarChartRodData(toY: y2, color: AppColors.color9CABE2, width: 9),
      ],
    );
  }
}

class MilestoneCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const MilestoneCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.colorCCCCCC),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Hexagon icon holder
          ImageView(path: icon),
          SizedBox(width: 30.w),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title).boldText(AppColors.color333333, 16.sp),
                SizedBox(height: 4.h),
                Text(subtitle).regularText(
                  AppColors.color473C37.withValues(alpha: 0.6),
                  13.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WeeklyGoalCard extends StatelessWidget {
  final double progress; // between 0.0 and 1.0
  const WeeklyGoalCard({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      width: 280.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: BoxBorder.all(color: AppColors.colorCCCCCC),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Weekly Goal Completion %",
            ).boldText(AppColors.color333333, 17.sp),

            SizedBox(height: 13.h),

            // Subtitle
            Text(
              "Progress toward weekly job target.",
            ).regularText(AppColors.color333333.withValues(alpha: 0.6), 12.sp),

            SizedBox(height: 40.h),

            // Percentage text
            Text(
              "${(progress * 100).toStringAsFixed(0)}%",
            ).regularText(AppColors.color293359, 20.sp),

            SizedBox(height: 14.h),

            // Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
                backgroundColor: AppColors.colorD9D9D9,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.color293359, // navy blue like screenshot
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      width: 280.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: BoxBorder.all(color: AppColors.colorCCCCCC),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rating + quote icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("4.8").boldText(AppColors.color333333, 12.sp),
                    SizedBox(width: 6.w),
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    Icon(Icons.star_half, color: Colors.amber, size: 14),
                  ],
                ),
                ImageView(path: AppImages.icQuote),
              ],
            ),
            SizedBox(height: 14.h),

            // Review title
            const Text(
              "THREE Years As a Member, Zero Regrets",
            ).boldText(AppColors.color333333.withValues(alpha: 0.8), 12.sp),
            SizedBox(height: 8.h),
            // Review text
            const Text(
              "The quality of work is impressive, and my electrical issues were resolved quickly.",
            ).regularText(AppColors.black.withValues(alpha: 0.5), 12.sp),
            SizedBox(height: 20.h),
            // User info
            Row(
              children: [
                Container(
                  height: 39.h,
                  width: 39.w,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: ImageView(path: AppImages.icDummy),
                ),
                SizedBox(width: 13.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Henrietta Elmore",
                    ).boldText(AppColors.color333333, 12.sp),
                    Text("Memphis, Florida").boldText(
                      AppColors.color333333.withValues(alpha: 0.7),
                      10.sp,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
