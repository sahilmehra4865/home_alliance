import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../helper/dialog_helper.dart';
import '../../../models/jobs_response.dart';
import '../../../service/api_services.dart';
import '../../models/job_detail_response.dart';

class OpenJobPageController extends GetxController {
  String selectedFilter = "Latest";
  bool isLoading = false;
  String? jobId;
  JobDetailResponse? jobDetailResponse;

  // OpenJobPageController(this.jobId); // ✅ receive jobId here

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
  Future<void> getJob(String reference) async {
    try {
      updateIsLoading(true);
      final model = await apiService.getJobById(reference);
      if (model != null) {
        jobDetailResponse = model;
      }
    } catch (e) {
      DialogHelper.message(e.toString());
    } finally {
      updateIsLoading(false);
    }
  }

  // ✅ Call this from UI init
  void initWithJobId(String reference) {
    jobId = reference;
    getJob(reference);
  }
}
