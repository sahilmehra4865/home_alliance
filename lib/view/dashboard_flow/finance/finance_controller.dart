import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_alliance/utils/app_extensions.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';

class FinanceController extends GetxController {
  bool isIncome = true;
  String selectedFilter = "Weekly";
  final List<String> filterOptions = ["Weekly", "Monthly", "Annual"];

  void updateIncomeExpenseToggle(bool val) {
    isIncome = val;
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
