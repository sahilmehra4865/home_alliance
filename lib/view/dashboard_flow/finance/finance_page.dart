import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/utils/route_strings.dart';
import 'package:home_alliance/widgets/scroll_behaviour.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_images.dart';
import '../../../widgets/image_view.dart';
import 'finance_controller.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FinanceController>(
      builder: (financeController) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.w),
                Text(
                  financeController.isIncome
                      ? "Total Earnings"
                      : "Total Expenses",
                ).regularText(AppColors.color333333, AppDimensions.d12.sp),
                AppSpacing.h10,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        financeController.isIncome
                            ? "\$3,782.42"
                            : "\$1,182.42",
                      ).boldText(AppColors.color333333, AppDimensions.d30.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 9.h,
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: BoxBorder.all(color: AppColors.colorCCCCCC),
                        ),
                        child: ImageView(path: AppImages.icExport),
                      ),
                    ),
                  ],
                ),
                AppSpacing.h35,

                // Tabs (Income / Expenses + Dropdown)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            financeController.updateIncomeExpenseToggle(true);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: financeController.isIncome
                                  ? AppColors.primaryDrk
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: financeController.getText(
                              financeController.isIncome,
                              "Income",
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            financeController.updateIncomeExpenseToggle(false);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: financeController.isIncome
                                  ? AppColors.white
                                  : AppColors.primaryDrk,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: financeController.getText(
                              !financeController.isIncome,
                              "Expenses",
                            ),
                          ),
                        ),
                      ],
                    ),
                    DropdownButton<String>(
                      value: financeController.selectedFilter,
                      underline: const SizedBox(),
                      isDense: true,
                      icon: SizedBox.shrink(), // <-- Hides the default arrow
                      items: financeController.filterOptions
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
                        financeController.selectedFilter = value!;
                        financeController.update();
                      },
                      selectedItemBuilder: (context) {
                        return financeController.filterOptions.map((e) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(e).regularText(
                                  AppColors.color333333,
                                  AppDimensions.d16.sp,
                                ),
                                SizedBox(width: 10.w),
                                ImageView(path: AppImages.icDownArrow),
                              ],
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 17.h),

                // Chart Card
                Container(
                  padding: EdgeInsets.only(left: 14.w, right: 24.w),
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
                          Text("Comparison").boldText(
                            AppColors.color333333,
                            AppDimensions.d15.sp,
                          ),
                          Spacer(),
                          Container(
                            height: 7.h,
                            width: 7.w,
                            decoration: BoxDecoration(
                              color: financeController.isIncome
                                  ? AppColors.color31974C
                                  : AppColors.colorDD2E44,
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
                              color: financeController.isIncome
                                  ? AppColors.color50FB7E
                                  : AppColors.colorFFC6C6,
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
                        child: _BarChart(financeController),
                      ),
                       SizedBox(height: 25.h),
                      Row(
                        children: [
                          Container(
                            height: 7.h,
                            width: 7.w,
                            decoration: BoxDecoration(
                              color: financeController.isIncome
                                  ? AppColors.color50FB7E
                                  : AppColors.colorFFC6C6,
                              shape: BoxShape.circle,
                            ),
                          ),
                          AppSpacing.w4,
                          Text(
                            "Last Week Total: ",
                          ).regularText(AppColors.black, AppDimensions.d10.sp),
                          Text(
                            "\$880",
                          ).boldText(AppColors.black, AppDimensions.d10.sp),
                          Spacer(),
                          Text(
                            "This Week Total: ",
                          ).regularText(AppColors.black, AppDimensions.d10.sp),
                          Text(
                            "\$1,256",
                          ).boldText(AppColors.black, AppDimensions.d10.sp),
                          AppSpacing.w4,
                          Icon(
                            financeController.isIncome
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
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
                AppSpacing.h40,

                // Transaction History
                Text(
                  "Transaction History",
                ).boldText(AppColors.color333333, AppDimensions.d15.sp),
                AppSpacing.h20,
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _transactionTile(
                            "Sarah J Parker",
                            "Appliance Repair",
                            financeController.isIncome ? "+\$600" : "-\$700",
                            "May 7, 2025",
                            financeController.isIncome
                                ? AppColors.color34A853
                                : AppColors.colorDD2E44,
                              financeController.isIncome
                          ),
                          _transactionTile(
                            "Ariel Flores",
                            "Appliance Repair",
                            financeController.isIncome ? "+\$600" : "-\$700",
                            "May 8, 2025",
                            financeController.isIncome
                                ? AppColors.color34A853
                                : AppColors.colorDD2E44,
                              financeController.isIncome
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _transactionTile(
    String name,
    String desc,
    String amount,
    String date,
    Color priceColor,
      bool isIncome,
  ) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteString.transactionReceiptPage);
      },
      child: Card(
        borderOnForeground: true,
        shadowColor: AppColors.black.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.colorD9D9D9),
          borderRadius: BorderRadius.circular(10.r),
        ),
        elevation: 2,
        margin: EdgeInsets.only(bottom: 15.h),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 17.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                  ).boldText(AppColors.color333333, AppDimensions.d16.sp),
                  AppSpacing.h10,
                  Text(
                    desc,
                  ).regularText(AppColors.color333333, AppDimensions.d12.sp),
                  AppSpacing.h20,
                  Text(
                    date,
                  ).regularText(AppColors.color333333, AppDimensions.d12.sp),
                ],
              ),
              Text(amount).boldText(priceColor, AppDimensions.d16.sp),
            ],
          ),
        ),
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  final FinanceController controller;
  const _BarChart(this.controller);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 2000, // fix max Y axis
        alignment: BarChartAlignment.spaceAround,
        barGroups: controller.isIncome
            ? [
                makeGroup(0, 300, 200),
                makeGroup(1, 700, 400),
                makeGroup(2, 500, 600),
                makeGroup(3, 1200, 700),
                makeGroup(4, 800, 600),
                makeGroup(5, 600, 500),
                makeGroup(6, 700, 400),
              ]
            : [
                makeGroup(0, 500, 300),
                makeGroup(1, 700, 500),
                makeGroup(2, 1200, 700),
                makeGroup(3, 800, 400),
                makeGroup(4, 600, 500),
                makeGroup(5, 500, 600),
                makeGroup(6, 700, 400),
              ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 500,
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
          horizontalInterval: 500,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: AppColors.bgLight, strokeWidth: 1);
          },
        ),
        // ✅ Force line at 2000
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: 2000,
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
        BarChartRodData(
          toY: y1,
          color: controller.isIncome
              ? AppColors.color31974C
              : AppColors.colorDD2E44,
          width: 9,
        ),
        BarChartRodData(
          toY: y2,
          color: controller.isIncome
              ? AppColors.color50FB7E
              : AppColors.colorFFC6C6,
          width: 9,
        ),
      ],
    );
  }
}
