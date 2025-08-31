import 'package:get/get.dart';
import 'package:home_alliance/utils/app_images.dart';

class HomePageController extends GetxController{
  bool isWeekly = true;
  String selectedFilter = "All";
  final List<String> filterOptions = ["All","Today", "Upcoming"];
  final jobs = [
    {
      "icon": AppImages.icRepair,
      "title": "Appliance Repair",
      "time": "TODAY, 8:00 AM",
      "address": "4118 Davana Rd, Los Angeles, CA",
    },
    {
      "icon": AppImages.icPlumber,
      "title": "Plumbing",
      "time": "TODAY, 1:00 PM",
      "address": "4118 Davana Rd, Los Angeles, CA",
    },
    {
      "icon": AppImages.icElectrical,
      "title": "Electrical",
      "time": "TODAY, 3:00 PM",
      "address": "4118 Davana Rd, Los Angeles, CA",
    },
  ];

}