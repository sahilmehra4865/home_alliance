import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:home_alliance/helper/shared_prefs.dart';
import 'package:home_alliance/service/api_services.dart';

import '../../helper/common_widgets.dart';
import '../../helper/dialog_helper.dart';
import '../../helper/routes.dart';
import '../../utils/route_strings.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  bool nameError = false;
  bool passwordError = false;
  void updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }

  void onLogin() {
    CommonWidgets.hideKeyBoard(Routes.navigatorKey.currentContext!);

    nameError = usernameController.text.trim().isEmpty;
    passwordError = passwordController.text.trim().isEmpty;
    update();
    if (nameError == false && passwordError == false) {
      // if (usernameController.text == "test" &&
      //     passwordController.text == "00000") {
      //   Get.offNamedUntil(RouteString.dashboardPage, (route) => false);
      // } else {
      //   DialogHelper.message("invalid_credentials");
      // }
      logIn();
    }
  }

  ApiService apiService = Get.find<ApiService>();
  Future<void> logIn() async {
    try {
      //SharedPrefs.clearSharedPrefs();
      updateIsLoading(true);
      final model = await apiService.login(
        usernameController.text.trim(),
        passwordController.text.trim(),
      );
      if (model?.accessToken != null) {
        SharedPrefs.prefs?.setString(SharedPrefs.jwtToken, model!.accessToken!);
        SharedPrefs.prefs?.setString(
          SharedPrefs.refreshToken,
          model!.refreshToken ?? "",
        );
        SharedPrefs.prefs?.setInt(
          SharedPrefs.expireIn,
          model!.expiresIn ?? 3600,
        );
        SharedPrefs.prefs?.setString(
          SharedPrefs.tokenTime,
          DateTime.now().toString(),
        );
        getUserDetails();
      }
    } on Exception {
     // await Future.delayed(const Duration(milliseconds: 200));
    //  DialogHelper.message("invalid_credentials");
    } finally {
      updateIsLoading(false);
    }
  }

  Future<void> getUserDetails() async {
    try {
      updateIsLoading(true);
      final model = await apiService.getDetails();
      if (model?.email != null) {
        SharedPrefs.prefs?.setString(
          SharedPrefs.userName,
          "${model!.firstName ?? ''} ${model.lastName ?? ''}",
        );
        SharedPrefs.prefs?.setString(
          SharedPrefs.userProfilePic,
          model!.avatar!,
        );
        SharedPrefs.prefs?.setBool(SharedPrefs.isLogin, true);
        Get.offNamedUntil(RouteString.dashboardPage, (route) => false);
      }
    } on Exception {
      DialogHelper.message("invalid_credentials");
    } finally {
      updateIsLoading(false);
    }
  }
}
