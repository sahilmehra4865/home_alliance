import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_alliance/view/authentication/login.dart';
import 'package:home_alliance/view/estimation/ai_estimation.dart';
import 'package:home_alliance/view/estimation/estimation_output.dart';
import 'package:home_alliance/view/invoice/create_invoice.dart';
import 'package:home_alliance/view/invoice/create_invoice_preview.dart';
import 'package:home_alliance/view/knowledge_center/knowledge_center_page.dart';
import 'package:home_alliance/view/knowledge_center/knowledge_center_search_page/knowledge_center_search_page.dart';
import 'package:home_alliance/view/notifications/notifications_page.dart';
import 'package:home_alliance/view/open_job/open_job.dart';
import 'package:home_alliance/view/sales_pipeline/sales_pipeIine.dart';
import 'package:home_alliance/view/splash_page.dart';
import 'package:home_alliance/view/transaction_receipt/transaction_receipt_page.dart';
import '../utils/route_strings.dart';
import '../view/dashboard_flow/dashboard_page.dart';
import '../view/knowledge_center/search_results_page.dart';

class Routes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final pages = [
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.loginPage,
      page: () => const LoginPage(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.dashboardPage,
      page: () => const DashboardPage(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.knowledgeCenterPage,
      page: () => const KnowledgeCenterPage(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.knowledgeCenterSearchPage,
      page: () => const KnowledgeCenterSearchPage(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.searchResultsPage,
      page: () => const SearchResultsPage(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.notificationsPage,
      page: () => const NotificationsPage(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.transactionReceiptPage,
      page: () => const TransactionReceiptPage(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.openJobPage,
      page: () => const OpenJobPage(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.createInvoicePage,
      page: () => const CreateInvoicePage(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.aiEstimation,
      page: () => const AiEstimationPage(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.estimationOutput,
      page: () => const EstimationOutput(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.createInvoicePreview,
      page: () => const CreateInvoicePreview(),
    ),
    GetPage(
      middlewares: [RouteMiddleware()],
      name: RouteString.salesPipeline,
      page: () => const SalesPipeline(),
    ),
  ];
}

class RouteMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    log("ROUTE_NAME : ${page?.name.substring(1, page.name.length)}");
    return super.onPageCalled(page);
  }
}
