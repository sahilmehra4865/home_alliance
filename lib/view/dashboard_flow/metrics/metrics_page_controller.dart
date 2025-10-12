import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/utils/app_extensions.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';

class MetricsPageController extends GetxController{
  int selectType = 0;
  int selectLeaderBoardType = 0;
  int selectedTab = 0;
  void updateSelectType(int val) {
    selectType = val;
    update();
  }
  void updateSelectLeaderBoardType(int val) {
    selectLeaderBoardType = val;
    update();
  }

  void updateSelectTab(int val) {
    selectedTab = val;
    update();
  }
  Widget getText(bool isBold, String text) {
    if (isBold) {
      return Text(text).boldText(AppColors.white, AppDimensions.d12.sp);
    } else {
      return Text(
        text,
      ).regularText(AppColors.color333333, AppDimensions.d12.sp);
    }
  }
}