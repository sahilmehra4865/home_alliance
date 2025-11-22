class RouteString {
  static final RouteString _routeString = RouteString._internal();

  factory RouteString() {
    return _routeString;
  }

  RouteString._internal();

  static const String splash = "/splash";
  static const String loginPage = "/loginPage";
  static const String dashboardPage = "/dashboardPage";
  static const String knowledgeCenterPage = "/knowledgeCenterPage";
  static const String knowledgeCenterSearchPage = "/knowledgeCenterSearchPage";
  static const String searchResultsPage = "/searchResultsPage";
  static const String notificationsPage = "/notificationsPage";
  static const String transactionReceiptPage = "/transactionReceiptPage";
  static const String openJobPage = "/openJobPage";
  static const String createInvoicePage = "/createInvoicePage";
  static const String aiEstimation = "/aiEstimation";
  static const String estimationOutput = "/estimationOutput";
  static const String createInvoicePreview = "/createInvoicePreview";
  static const String salesPipeline = "/salesPipeline";
  static const String leaderBoardPage = "/leaderBoardPage";
  static const String openJobs = "/openJobs";
  static const String jobInfo = "/jobInfo";
}
