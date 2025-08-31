import 'package:get/get.dart';

class JobController extends GetxController {
  String selectedFilter = "Latest";
  final List<String> filterOptions = [
    "Latest",
    "Oldest",
    "Today",
    "Completed",
    "Pending",
  ];
}
