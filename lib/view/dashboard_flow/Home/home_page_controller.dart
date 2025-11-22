import 'package:get/get.dart';
import 'package:home_alliance/utils/app_images.dart';

import '../../../helper/dialog_helper.dart';
import '../../../models/jobs_response.dart';
import '../../../service/api_services.dart';

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
  bool isLoading = false;
  JobListResponse? jobListResponse;


  void updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }

  ApiService apiService = Get.find<ApiService>();
  Future<void> getJobs(bool isOpenJob) async {
    try {
      //SharedPrefs.clearSharedPrefs();
      updateIsLoading(true);
      final model = await apiService.getJobs(true);
      if (model != null) {
        jobListResponse = model;
      }
    } catch (e) {
  //    DialogHelper.message(e.message);
    } finally {
      updateIsLoading(false);
    }
  }

  @override
  void onInit() {
   // getJobs();
    super.onInit();
  }
}
