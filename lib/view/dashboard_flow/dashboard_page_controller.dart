import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:home_alliance/view/dashboard_flow/Home/new_home.dart';

import '../comming_soon.dart';
import 'Home/home_page.dart';
import 'Home/home_var_page.dart';
import 'finance/finance_page.dart';
import 'jobs/jobs_page.dart';
import 'metrics/metrics_page.dart';

class DashboardPageController extends GetxController {
  int selectItem = 0;
  String? fcmToken;
  bool home = false;
  void onItemTapped(int index) {
    if (index == 0) {
      changeHomeScreen();
    }
    selectItem = index;
    update();
  }

  changeHomeScreen() {
    home = !home;
    update();
  }

  List<Widget> get widgetOptions => [
    const NewHomePage(), //   home ? const HomePage() : const HomeVarPage(),
     //const FinancePage(),
   //  MetricsPage(),
   const JobsPage(),
  ];
}
