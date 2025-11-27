import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_alliance/view/job_screens/dialogs/action_required_dialog.dart';

import '../../helper/routes.dart';
import 'dialogs/add_new_payment_dialog.dart';

class JobInfoController extends GetxController {
  bool isAccepted = false;
  bool isShowDescription = false;
  int selectedTab = 0;
  int jobStatus = 0;
  void selectTab(int tabIndex) {
    selectedTab = tabIndex;
    update();
  }

  void updateDescription() {
    isShowDescription = !isShowDescription;
    update();
  }


  @override
  void onInit() {
    // getJobs();
    // Future.microtask(() {
    //   showActionRequiredDialog(Routes.navigatorKey.currentContext!);
    // });

  }

}
