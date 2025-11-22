import 'package:get/get.dart';

class JobInfoController extends GetxController {
  bool isAccepted = false;
  bool isShowDescription = false;
  int selectedTab = 0;
  int jobStatus = 0;
  void selectTab(int tabIndex) {
    selectedTab = tabIndex;
    update();
  }

  void updateDescription() {
    isShowDescription = !isShowDescription;
    update();
  }

}
