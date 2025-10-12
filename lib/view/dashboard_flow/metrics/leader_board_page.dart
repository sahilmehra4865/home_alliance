import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/widgets/scroll_behaviour.dart';

import '../../../helper/common_widgets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_spacing.dart';
import '../../../utils/route_strings.dart';
import '../../../widgets/image_view.dart';
import '../dashboard_page_controller.dart';
import 'metrics_page.dart';
import 'metrics_page_controller.dart';

class LeaderBoardPage extends StatelessWidget {
  LeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MetricsPageController>(
      builder: (metricsPageController) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.5.h),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.5.h),
                  child: CommonWidgets.appBar(
                    "performance_metrics",
                    suffix: ImageView(path: AppImages.icSettings),
                    backTap: () {
                      final DashboardPageController dashboardPageController =
                          Get.find();
                      dashboardPageController.onItemTapped(0);
                    },
                  ),
                ),
                AppSpacing.h32,
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          metricsPageController.updateSelectTab(0);
                          Get.back();
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Text(
                                "Badges",
                                style: TextStyle(
                                  fontWeight:
                                      metricsPageController.selectedTab == 0
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: metricsPageController.selectedTab == 0
                                      ? AppColors.color293359
                                      : AppColors.color333333,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16.h),
                                height: metricsPageController.selectedTab == 0
                                    ? 3.h
                                    : 1.h,
                                color: metricsPageController.selectedTab == 0
                                    ? AppColors.color293359
                                    : AppColors.colorCCCCCC,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          metricsPageController.updateSelectTab(1);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Text(
                                "Leaderboard",
                                style: TextStyle(
                                  fontWeight:
                                      metricsPageController.selectedTab == 1
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: metricsPageController.selectedTab == 1
                                      ? AppColors.color293359
                                      : AppColors.color333333,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16.h),
                                height: metricsPageController.selectedTab == 1
                                    ? 3.h
                                    : 1.h,
                                color: metricsPageController.selectedTab == 1
                                    ? AppColors.color293359
                                    : AppColors.colorCCCCCC,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AppSpacing.h32,
                leaderBoard(metricsPageController),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget leaderBoard(MetricsPageController metricsPageController) {
    return Expanded(
      // <-- Wrap the whole leaderboard with Expanded to avoid overflow
      child: Column(
        children: [
          // Tabs (Daily, Monthly, All Time)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 32.h,
                decoration: BoxDecoration(
                  color: AppColors.colorF5F5F5,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  children: List.generate(3, (index) {
                    final titles = ["Daily", "Monthly", "All Time"];
                    return GestureDetector(
                      onTap: () => metricsPageController
                          .updateSelectLeaderBoardType(index),
                      child: Container(
                        width: AppDimensions.d100,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              metricsPageController.selectLeaderBoardType ==
                                  index
                              ? AppColors.primaryDrk
                              : AppColors.colorF5F5F5,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: metricsPageController.getText(
                            metricsPageController.selectLeaderBoardType ==
                                index,
                            titles[index],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          /// Top 3 Players
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: buildTopPlayer(leaderboard[1], 2),
              ),
              buildTopPlayer(leaderboard[0], 1, isWinner: true),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: buildTopPlayer(leaderboard[2], 3),
              ),
            ],
          ),
          AppSpacing.h24,

          /// Table Header
          Container(
            height: 32.h,
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text("Rank").regularText(AppColors.color333333, 12.h),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Player",
                  ).regularText(AppColors.color333333, 12.h),
                ),
                Expanded(
                  flex: 2,
                  child: Text("Points").regularText(
                    AppColors.color333333,
                    12.h,
                    align: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),

          /// Players List (Scrollable)
          Expanded(
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 30),
                itemCount: 10, // excluding top 3
                itemBuilder: (context, index) {
                  final player = leaderboard[3];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                    child: SizedBox(
                      height: 50.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(padding:EdgeInsets.only(left: 10) ,child: Text(
                            "${player['rank']}",
                            ).regularText(AppColors.color333333, 12.h),
                      ),),
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,//AppColors.colorCCCCCC,
                                    borderRadius: BorderRadius.circular(14.r),
                                  ),
                                  padding: EdgeInsets.all(1),

                                  child: CircleAvatar(
                                    radius: 14.r,
                                    backgroundColor: AppColors.color293359,
                                    child: ImageView(
                                      path: AppImages.icJhon,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  player['name'],
                                ).regularText(AppColors.color333333, 12.h),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.monetization_on,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "${player['points']} points",
                                ).regularText(AppColors.color333333, 12.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTopPlayer(
    Map<String, dynamic> player,
    int rank, {
    bool isWinner = false,
  }) {
    return Column(
      children: [
        if (isWinner) ImageView(height: 24, path: AppImages.icCrown),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.color293359,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(2),
              child: CircleAvatar(
                radius: 40,
                child: ImageView(path: AppImages.icDummy, fit: BoxFit.fill),
              ),
            ),

            Positioned(
              bottom: -8,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: AppColors.color293359,
                child: Text("$rank").regularText(AppColors.white, 10.h),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(player["name"]).boldText(AppColors.color333333, 12.sp),
        Text("${player["points"]} pts").regularText(AppColors.black, 10.h),
      ],
    );
  }

  final List<Map<String, dynamic>> leaderboard = [
    {
      "rank": 1,
      "name": "John S.",
      "points": 2000,
      "image": "https://i.pravatar.cc/150?img=1",
    },
    {
      "rank": 2,
      "name": "John S.",
      "points": 2000,
      "image": "https://i.pravatar.cc/150?img=2",
    },
    {
      "rank": 3,
      "name": "John S.",
      "points": 2000,
      "image": "https://i.pravatar.cc/150?img=3",
    },
    {
      "rank": 4,
      "name": "John Smith",
      "points": 1569,
      "image": "https://i.pravatar.cc/150?img=4",
    },
    {
      "rank": 4,
      "name": "John Smith",
      "points": 1569,
      "image": "https://i.pravatar.cc/150?img=5",
    },
    {
      "rank": 4,
      "name": "John Smith",
      "points": 1569,
      "image": "https://i.pravatar.cc/150?img=6",
    },
    {
      "rank": 4,
      "name": "John Smith",
      "points": 1569,
      "image": "https://i.pravatar.cc/150?img=7",
    },
  ];
}
