import 'package:get/get.dart';

class SearchResultsController extends GetxController {
  String selectedFilter = "Relevance";
  final List<String> filterOptions = ["Relevance", "Newest", "Oldest"];
  // Mock titles
  List<String> titles = [
    "How to Navigate the App",
    "How to unclog the toilet",
    "How to view Statistics",
    "How to manage Expenses",
    "How to Navigate the App",
    "How to unclog the toilet",
    "How to view Statistics",
    "How to manage Expenses",
  ];
}
