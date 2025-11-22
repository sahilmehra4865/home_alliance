import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_alliance/helper/common_widgets.dart';
import 'package:home_alliance/helper/dialog_helper.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_dimension.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_images.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/view/authentication/login_page_controller.dart';
import 'package:home_alliance/widgets/image_view.dart';
import 'package:home_alliance/widgets/scroll_behaviour.dart';

import '../../utils/route_strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (loginController) {
        return Scaffold(
          backgroundColor: AppColors.primaryDrk,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryDrk, AppColors.primaryLight],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: AppDimensions.d35.h),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: AppDimensions.d107.h),

                          // Logo
                          Center(
                            child: ImageView(
                              path: AppImages.icLogo,
                              height: AppDimensions.d112.h,
                              width: AppDimensions.d184.w,
                            ),
                          ),
                          SizedBox(height: AppDimensions.d85.h),

                          // White Container Card
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 1.55,
                            padding: EdgeInsets.symmetric(
                              vertical: AppDimensions.d88.h,
                              horizontal: AppDimensions.d54.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(AppDimensions.d50.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("WELCOME!").regularText(
                                  AppColors.color333333,
                                  AppDimensions.d24.sp,
                                ),

                                AppSpacing.h35,

                                // Username Field
                                CustomTextField(
                                  controller:
                                      loginController.usernameController,
                                  hint: "Username",
                                  errorText: loginController.nameError
                                      ? "Username Required!"
                                      : null,
                                  onChanged: (v) => setState(() {
                                    loginController.nameError = v
                                        .trim()
                                        .isEmpty;
                                  }),
                                ),

                                AppSpacing.h30,

                                // Password Field
                                CustomTextField(
                                  controller:
                                      loginController.passwordController,
                                  hint: "Password",
                                  obscureText: loginController.obscurePassword,
                                  errorText: loginController.passwordError
                                      ? "Password Required!"
                                      : null,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      loginController.obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      size: AppDimensions.d24,
                                      color: AppColors.color333333.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                    onPressed: () => setState(
                                      () => loginController.obscurePassword =
                                          !loginController.obscurePassword,
                                    ),
                                  ),
                                  onChanged: (v) => setState(() {
                                    loginController.passwordError = v
                                        .trim()
                                        .isEmpty;
                                  }),
                                ),

                                // AppSpacing.h10,
                                //
                                // // Forgot Password
                                // Row(
                                //   children: [
                                //     const Spacer(),
                                //     GestureDetector(
                                //       onTap: () {},
                                //       child: Text("Forgot Password?").regularText(
                                //         AppColors.color293359,
                                //         AppDimensions.d14.sp,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                AppSpacing.h30,

                                // Login Button
                                loginController.isLoading
                                    ? CircularProgressIndicator()
                                    : SizedBox(
                                        width: double.infinity,
                                        height: AppDimensions.d54.h,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.blueButton,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    AppDimensions.d10.r,
                                                  ),
                                            ),
                                          ),
                                          onPressed: loginController.onLogin,
                                          child: Text("Login").boldText(
                                            AppColors.white,
                                            AppDimensions.d14.sp,
                                          ),
                                        ),
                                      ),

                                const SizedBox(height: 15),

                                // Sign Up
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     const Text("New User? ").regularText(
                                //       AppColors.colorCCCCCC,
                                //       AppDimensions.d14.sp,
                                //     ),
                                //     GestureDetector(
                                //       onTap: () {
                                //         // TODO: Navigate to SignUp
                                //       },
                                //       child: const Text("Sign Up").regularText(
                                //         AppColors.color293359,
                                //         AppDimensions.d14.sp,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isError = errorText != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: AppDimensions.d286.w,
          height: AppDimensions.d54.h,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            obscuringCharacter: "*",
            cursorHeight: AppDimensions.d16.h,
            onChanged: onChanged,
            style: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.color333333.withValues(alpha: 0.6),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppDimensions.d20.w,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                borderSide: BorderSide(
                  color: isError
                      ? AppColors.colorDD2E44
                      : AppColors.colorCCCCCC,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                borderSide: BorderSide(
                  color: isError
                      ? AppColors.colorDD2E44
                      : AppColors.colorCCCCCC,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                borderSide: BorderSide(
                  color: isError
                      ? AppColors.colorDD2E44
                      : AppColors.colorCCCCCC,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        if (isError) ...[
          AppSpacing.h10,
          Text(
            errorText!,
          ).regularText(AppColors.colorDD2E44, AppDimensions.d14.sp),
        ],
      ],
    );
  }
}
