import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_alliance/utils/app_images.dart';
import 'package:home_alliance/widgets/image_view.dart';

import '../utils/app_colors.dart';
import '../utils/route_strings.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    onInit();
    super.initState();
  }

  Future<void> onInit() async {
    Future.delayed(const Duration(seconds: 2), () async {
      //User? user = await _auth.authStateChanges().first;

      // No user logged in, navigate to (Login) screen
      Get.offNamedUntil(RouteString.loginPage, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryDrk, // Dark Blue
              AppColors.primaryLight, // Light Blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ImageView(
          path: AppImages.icSplash,
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
