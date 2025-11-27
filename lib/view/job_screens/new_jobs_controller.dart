import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../helper/dialog_helper.dart';
import '../../../models/jobs_response.dart';
import '../../../service/api_services.dart';

class NewJobsController extends GetxController {
  String selectedFilter = "Latest";
  bool isLoading = false;
  JobListResponse? openJobListResponse;
  JobListResponse? closeJobListResponse;
  List<Jobs> jobsOpen = [];
  List<Jobs> jobsClose = [];
  int selectedTab = 0; // 0 = Open Jobs, 1 = Closed Jobs
  String formatJobDate(String rawDate) {
    try {
      final dt = DateTime.parse(rawDate);
      return DateFormat('E, MMM d').format(dt); // Mon, May 14
    } catch (_) {
      return rawDate;
    }
  }

  final List<String> filterOptions = ["Latest", "Oldest", "Today", "Completed", "Pending"];

  void updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }

  ApiService apiService = Get.find<ApiService>();
  Future<void> getJobs(bool isOpenJob) async {
    try {
      //SharedPrefs.clearSharedPrefs();
      updateIsLoading(true);
      if (isOpenJob) {
        final model = await apiService.getJobs(isOpenJob);
        if (model != null) {
          if (isOpenJob) {
            openJobListResponse = model;
            jobsOpen = openJobListResponse?.jobs ?? [];
          } else {
            closeJobListResponse = model;
            jobsClose = closeJobListResponse?.jobs ?? [];
          }
        }
      }
    } catch (e) {
      DialogHelper.message(e.toString());
    } finally {
       updateIsLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  final jsonData = {
    "jobs": [
      {
        "date": "3rd Quarter",
        "time": "09:00AM",
        "status": "Completed",
        "department": "Appliance Repair High End",
        "location": "313 Grand Boulevard,  Los Angeles, CA 90291",
        "description": "Test commission first job",
        "reference": "ZNNCS3",
        "sales": 4000,
        "parts": 0,
        "payments": 4000,
      },
      {
        "date": "3rd Quarter",
        "time": "09:00AM",
        "status": "New Request",
        "department": "Appliance Repair Regular",
        "location": "1450 Coleman Avenue,  Santa Clara, CA 95050",
        "description": "wwwwwwwwwwwwwwwwwwwwwwwwwwwww",
        "reference": "ZTLNEV",
        "sales": 0,
        "parts": 0,
        "payments": 0,
      },
    ],
    "meta": {"today": 0, "completed": 34},
  };

  // 34
}
