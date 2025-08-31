import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_dimension.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_images.dart';

import '../../widgets/image_view.dart';
import 'dashboard_page_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardPageController dashboardPageController = Get.find();
    return GetBuilder<DashboardPageController>(
      builder: (dashboardPageController) {
        return Scaffold(
          body: Center(
            child: dashboardPageController
                .widgetOptions[dashboardPageController.selectItem],
          ),
          bottomNavigationBar: bottomNavBar(dashboardPageController),
        );
      },
    );
  }

  Widget bottomNavBar(DashboardPageController dashboardController) {
    return SizedBox(
      height: AppDimensions.d93.h,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
          //  topLeft: Radius.circular(AppDimensions.d20.r),
          //  topRight: Radius.circular(AppDimensions.d20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
    //   padding: EdgeInsets.symmetric(horizontal: AppDimensions.d30.w),
        child: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: dashboardController.selectItem == 0
                  ? activeBottomItem(AppImages.icHomeFill,"Home", 0, dashboardController)
                  : inActiveBottomItem(AppImages.icHome,"Home", 0, dashboardController),
            ),
            Expanded(
              child: dashboardController.selectItem == 1
                  ? activeBottomItem(AppImages.icFinanceFill,"Finance", 1, dashboardController)
                  : inActiveBottomItem(
                      AppImages.icFinance,"Finance"
              ,                    1,
                      dashboardController,
                    ),
            ),


            Expanded(
              child: dashboardController.selectItem == 2
                  ? activeBottomItem(AppImages.icMetricsFill,"Metrics", 2, dashboardController)
                  : inActiveBottomItem(
                      AppImages.icMetrics,"Metrics",
                      2,
                      dashboardController,
                    ),
            ),
            Expanded(
              child: dashboardController.selectItem == 3
                  ? activeBottomItem(AppImages.icJobsFill,"Jobs", 3, dashboardController)
                  : inActiveBottomItem(AppImages.icJobs,"Jobs", 3, dashboardController),
            ),
          ],
        ),
      ),
    );
  }

  Widget inActiveBottomItem(
    String iconPath,
    String title,
    int index,
    DashboardPageController dashboardController,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        dashboardController.onItemTapped(index);
      },
      child: SizedBox(
        //width: AppDimensions.d50.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //  const ImageView(path: AppImages.icRectangle, color: Colors.transparent),
          SizedBox(height: AppDimensions.d15.h),
            ImageView(
              path: iconPath,
              height: AppDimensions.d32.h,
              width: AppDimensions.d32.w,
            ),
            SizedBox(height: AppDimensions.d5.h),
            Text(title).regularText(
              AppColors.color333333.withValues(alpha: 0.6),
              AppDimensions.d12.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget activeBottomItem(String iconPath, String title, int index,
      DashboardPageController dashboardController,) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        dashboardController.onItemTapped(index);
      },child: SizedBox(
        //width: AppDimensions.d50.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: AppDimensions.d5.h,
              width: AppDimensions.d50.w,
              decoration: BoxDecoration(
                color: AppColors.color293359,
              //  borderRadius: BorderRadius.circular(AppDimensions.d200.r),
              ),
            ),
            // const ImageView(path: AppImages.icRectangle),
            SizedBox(height: AppDimensions.d10.h),
            ImageView(
              path: iconPath,
              height: AppDimensions.d32.h,
              width: AppDimensions.d32.w,
              color: AppColors.color293359,
            ),
            SizedBox(height: AppDimensions.d5.h),
            Text(title).boldText(
              AppColors.color293359,
              AppDimensions.d12.sp,
            ),
          ],
        ),
      ),
    );
  }
}



