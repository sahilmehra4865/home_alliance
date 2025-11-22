import 'package:get/get.dart';
import 'package:home_alliance/view/dashboard_flow/Home/home_page_controller.dart';
import 'package:home_alliance/view/dashboard_flow/finance/finance_controller.dart';
import 'package:home_alliance/view/dashboard_flow/metrics/metrics_page_controller.dart';
import 'package:home_alliance/view/job_screens/job_info_controller.dart';
import 'package:home_alliance/view/open_job/open_job_page_controller.dart';
import '../../service/api_services.dart';
import '../../view/authentication/login_page_controller.dart';
import '../../view/dashboard_flow/dashboard_page_controller.dart';
import '../../view/dashboard_flow/jobs/jobs_controller.dart';
import '../../view/invoice/create_invoice_preview_controller.dart';
import '../../view/knowledge_center/search_results_controller.dart';
import '../../view/transaction_receipt/transaction_receipt_controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => DashboardPageController(), fenix: true);
    Get.lazyPut(() => HomePageController(), fenix: true);
    Get.lazyPut(() => SearchResultsController(), fenix: true);
    Get.lazyPut(() => FinanceController(), fenix: true);
    Get.lazyPut(() => TransactionReceiptController(), fenix: true);
    Get.lazyPut(() => JobController(), fenix: true);
    Get.lazyPut(() => OpenJobPageController(), fenix: true);
    Get.lazyPut(() => MetricsPageController(), fenix: true);
    Get.lazyPut(() => CreateInvoicePreviewController(), fenix: true);
    Get.lazyPut(() => JobInfoController(), fenix: true);
    Get.lazyPut(() => ApiService(), fenix: true);
  }
}
