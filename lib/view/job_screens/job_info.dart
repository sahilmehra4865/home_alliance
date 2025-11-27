import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/view/job_screens/dialogs/add_material_dialog.dart';
import 'package:home_alliance/view/job_screens/dialogs/edit_payment_dialog.dart';
import 'package:home_alliance/view/job_screens/job_info_controller.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';

import '../../../../helper/common_widgets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_spacing.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/scroll_behaviour.dart';
import '../../utils/app_dimension.dart';
import 'dialogs/add_appliances_dialog.dart';
import 'dialogs/add_estimation_dialog.dart';
import 'dialogs/add_new_payment_dialog.dart';
import 'dialogs/add_new_sale_dalog.dart';
import 'dialogs/add_note.dart';
import 'dialogs/edit_material_dailog.dart';
import 'dialogs/edit_sales_dailog.dart';
import 'dialogs/left_status_dialog.dart';

class JobInfoScreen extends StatelessWidget {
  const JobInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobInfoController>(
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                color: AppColors.colorF5F5F5.withValues(alpha: 0.95),
                height: 115.h,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    ImageView(
                      height: 110.h,
                      width: double.maxFinite,
                      path: AppImages.icBg,
                    ),
                    Column(
                      children: [
                        SizedBox(height: 60.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: CommonWidgets.appBar(
                            "Back",
                            suffix: controller.isAccepted
                                ? GestureDetector(
                                    onTap: () {
                                      controller.isAccepted = false;
                                      controller.update();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5.h,
                                        horizontal: 8.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.colorDD2E44,
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Center(
                                            child: Text(
                                              "Close Job",
                                            ).boldText(AppColors.white, 14.sp),
                                          ),
                                          AppSpacing.w10,
                                          ImageView(path: AppImages.icExit),
                                        ],
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.white,
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSpacing.h20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Job Title
                              Text("Appliance Repair").semiBoldText(
                                AppColors.color333333.withValues(alpha: 0.8),
                                20.sp,
                              ),
                            ],
                          ),

                          SizedBox(height: 8.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ImageView(path: AppImages.icCalendarTik),
                              AppSpacing.w8,
                              Text(
                                "Tuesday, August 19",
                              ).regularText(AppColors.color949494, 13.sp),
                              AppSpacing.w8,
                              Container(
                                height: 12.h,
                                width: 1.w,
                                decoration: BoxDecoration(
                                  color: AppColors.colorD9D9D9,
                                ),
                              ),
                              AppSpacing.w8,
                              Text(
                                "9:00AM - 11:00AM",
                              ).regularText(AppColors.color949494, 13.sp),
                            ],
                          ),
                          AppSpacing.h16,

                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.colorF4900C,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  "Job #FKZJQE",
                                ).regularText(AppColors.color333333, 12.sp),
                              ),
                              AppSpacing.w10,
                              Row(
                                children: [
                                  ImageView(path: AppImages.icLocation),
                                  AppSpacing.w4,
                                  Text("25km away").regularText(
                                    AppColors.color333333.withValues(
                                      alpha: 0.8,
                                    ),
                                    AppDimensions.d13.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          if (controller.selectedTab != 2)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 40.h),
                                Text("Job Status").semiBoldText(
                                  AppColors.color555555,
                                  AppDimensions.d13.sp,
                                ),
                                SizedBox(height: 16.h),
                                !controller.isAccepted
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      const ReasonForRejectDialog(),
                                                );
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 5.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.colorDD2E44,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        8.r,
                                                      ),
                                                ),
                                                child: Center(
                                                  child: Text("Reject")
                                                      .boldText(
                                                        AppColors.white,
                                                        14.sp,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          AppSpacing.w16,
                                          Text("OR").regularText(
                                            AppColors.color555555,
                                            14.sp,
                                          ),
                                          AppSpacing.w16,
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.isAccepted = true;
                                                controller.update();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 5.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.color293359,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        8.r,
                                                      ),
                                                ),
                                                child: Center(
                                                  child: Text("Accept")
                                                      .boldText(
                                                        AppColors.white,
                                                        14.sp,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildStatusStep(
                                            icon: AppImages.icMoveLocation,
                                            title: "On my Way",
                                            actionText: "Select",
                                            isCompleted:
                                                controller.jobStatus != 0,
                                            isActive: controller.jobStatus == 0,
                                            onTap: () {
                                              controller.jobStatus = 1;
                                              controller.update();
                                            },
                                          ),
                                          _buildLine(),
                                          _buildStatusStep(
                                            icon: AppImages.icArrived,
                                            title: "Arrived",
                                            actionText: "Select",
                                            isCompleted:
                                                controller.jobStatus > 1,
                                            isActive: controller.jobStatus == 1,
                                            onTap: () {
                                              controller.jobStatus = 2;
                                              controller.update();
                                            },
                                          ),
                                          _buildLine(),
                                          _buildStatusStep(
                                            icon: AppImages.icLeft,
                                            title: "Left",
                                            actionText: "Select",
                                            isCompleted:
                                                controller.jobStatus > 2,
                                            isActive: controller.jobStatus == 2,
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (_) => LeftStatusDialog(),
                                              ).then((v){
                                              //  controller.jobStatus = 3;
                                                controller.update();
                                              });

                                            },
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          SizedBox(height: 40.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildTab(
                                "Job Info",
                                controller.selectedTab == 0,
                                () {
                                  controller.selectTab(0);
                                },
                              ),
                              _buildTab(
                                "Sales",
                                controller.selectedTab == 1,
                                () {
                                  controller.selectTab(1);
                                },
                              ),
                              _buildTab(
                                "Job Files",
                                controller.selectedTab == 2,
                                () {
                                  controller.selectTab(2);
                                },
                              ),
                            ],
                          ),
                          Container(
                            height: 1.h,
                            width: double.maxFinite,
                            color: AppColors.colorD9D9D9,
                          ),
                          SizedBox(height: 40.h),
                          if (controller.selectedTab == 0) jobInfoTab(context),
                          if (controller.selectedTab == 1)
                            sales(context, controller),
                          if (controller.selectedTab == 2) jobFiles(context),
                          SizedBox(height: 50.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// job info tab widgets ___________
  Widget jobInfoTab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Customer Info").semiBoldText(
              AppColors.color333333.withValues(alpha: 0.8),
              AppDimensions.d14.sp,
            ),
           // ImageView(path: AppImages.icMenu),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 72.h,
              width: 72.w, // Border thickness
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.colorD9D9D9, // Border color
                  width: 1.w, // Border width
                ),
              ),
              child: Center(
                child: Text(
                  "PJ",
                ).semiBoldText(AppColors.color333333, AppDimensions.d20.sp),
              ),
            ),

            SizedBox(width: 12.w),

            // Customer info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Patricia Jimenez").semiBoldText(
                        AppColors.color333333.withValues(alpha: 0.8),
                        16.sp,
                      ),
                    ],
                  ),
                  AppSpacing.h8,
                  Container(
                    width: 100.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        width: 1,
                        color: AppColors
                            .colorD9D9D9, // keep transparent to show gradient
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFF9F9F9), // top
                          Color(0xFFE5E5E5),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Prime Silver",
                      ).regularText(AppColors.color555555, 10.sp),
                    ),
                  ),
                  AppSpacing.h16,
                  SizedBox(height: 6.h),

                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("+1 (747) 369-4394").regularText(
                            AppColors.color333333.withValues(alpha: 0.8),
                            12.sp,
                          ),
                          AppSpacing.h14,
                          Text("tmqueen13@icloud.com").regularText(
                            AppColors.color333333.withValues(alpha: 0.8),
                            12.sp,
                          ),
                        ],
                      ),
                      Spacer(),
                      ImageView(path: AppImages.icPhone),
                      AppSpacing.w20,
                      ImageView(path: AppImages.icChat),
                    ],
                  ),
                ],
              ),
            ),

            // Action icons
          ],
        ),

        SizedBox(height: 32.h),

        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: SizedBox(
            width: double.maxFinite,
            child: ImageView(path: AppImages.icMapMark, fit: BoxFit.fill),
          ),
        ),
        SizedBox(height: 30.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location:").regularText(
              AppColors.color333333.withValues(alpha: 0.8),
              AppDimensions.d13.sp,
            ),
            AppSpacing.w4,
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: ImageView(path: AppImages.icLocation),
            ),
            AppSpacing.w4,
            Expanded(
              child: Text("4118 Davana Road, Los Angeles, CA 91423")
                  .regularText(
                    AppColors.color333333.withValues(alpha: 0.8),
                    AppDimensions.d13.sp,
                  ),
            ),
          ],
        ),
        SizedBox(height: 40.h),
        Text("Job Description").semiBoldText(
          AppColors.color333333.withValues(alpha: 0.8),
          AppDimensions.d13.sp,
        ),
        divider(),
        SizedBox(height: 20.h),
        detailRow("Department:", "Plumbing Reg"),
        AppSpacing.h10,
        detailRow("Type / Brand:", "Toilet/Sink/Repair/ Service"),
        AppSpacing.h10,
        detailRow("Equip Age:", "3600"),
        AppSpacing.h10,
        detailRow("Prior Call:", "30 min"),
        AppSpacing.h10,
        detailRow("Service Call Fee:", "90"),
        AppSpacing.h10,
        Text("Description:").semiBoldText(
          AppColors.color333333.withValues(alpha: 0.8),
          AppDimensions.d13.sp,
        ),
        AppSpacing.h10,
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(AppDimensions.d14),
          decoration: BoxDecoration(
            border: BoxBorder.all(color: AppColors.colorF5F5F5),
            borderRadius: BorderRadius.circular(AppDimensions.d8.r),
          ),
          child: Text(
            "Job is hard.",
          ).regularText(AppColors.color555555, AppDimensions.d13.sp),
        ),
        SizedBox(height: 40.h),
        Row(
          children: [
            Text("Dispatcher Info").semiBoldText(
              AppColors.color333333.withValues(alpha: 0.8),
              AppDimensions.d13.sp,
            ),
            Spacer(),
            ImageView(path: AppImages.icQMark),
          ],
        ),
        AppSpacing.h8,
        Row(
          children: [
            Container(
              height: 56.h,
              width: 56.w, // Border thickness
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.colorD9D9D9, // Border color
                  width: 1.w, // Border width
                ),
              ),
              child: Center(
                child: Text(
                  "PJ",
                ).semiBoldText(AppColors.color333333, AppDimensions.d20.sp),
              ),
            ),

            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppSpacing.h5,
                Text("Dispatcher").regularText(
                  AppColors.color333333.withValues(alpha: 0.8),
                  10.sp,
                ),
                AppSpacing.h10,
                Row(
                  children: [
                    Text("Stephanie").semiBoldText(
                      AppColors.color333333.withValues(alpha: 0.8),
                      16.sp,
                    ),
                  ],
                ),
                AppSpacing.h8,
              ],
            ),
            Spacer(),
            ImageView(path: AppImages.icPhone),
            AppSpacing.w20,
            ImageView(path: AppImages.icChat),
          ],
        ),
        SizedBox(height: 40.h),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.colorF5F5F5,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.h8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text("Appliances").semiBoldText(
                  AppColors.color333333.withValues(alpha: 0.8),
                  14.sp,
                ),
              ),

              AppSpacing.h8,
              Container(
                height: 1.h,
                width: double.maxFinite,
                color: AppColors.colorD9D9D9,
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Refrigerator").regularText(AppColors.color333333, 16.sp),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text("Brand Type: ").regularText(AppColors.color555555, 14.sp),
                Text("Sony").regularText(AppColors.color3332CA, 14.sp),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.h),
        addApplianceButton("Add Appliance", () {
          showDialog(
            context: context,
            builder: (_) => const AddApplianceDialog(),
          );
        }),
        SizedBox(height: 40.h),
        Row(
          children: [
            Text(
              "Notes",
            ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
            Spacer(),
            ImageView(path: AppImages.icEdit),
            SizedBox(width: 4.w),
            Text("Edit").semiBoldText(AppColors.color3332CA, 14.sp),
          ],
        ),
        divider(),
        SizedBox(height: 20.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              TextField(
                maxLines: 6,
                // maxLength: 200,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "What do you have in mind?",
                  hintStyle: TextStyle(
                    color: AppColors.color333333.withValues(alpha: 0.2),
                    fontSize: 14.sp,
                  ),
                ),
                style: TextStyle(color: Colors.black87, fontSize: 14.sp),
              ),

              // Bottom-right word count + avatar
              Positioned(
                bottom: 0,
                right: 0,
                child: Row(
                  children: [
                    SizedBox(width: 6.w),
                    Text(
                      "0/200 words",
                      style: TextStyle(
                        color: AppColors.color333333.withValues(alpha: 0.2),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget addApplianceButton(String data, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [5, 5],
          strokeWidth: 1,
          radius: Radius.circular(16.r),
          color: AppColors.colorD9D9D9,
        ),
        child: Container(
          height: 40.h,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_outlined,
                color: AppColors.color3332CA,
                size: 20.sp,
              ),
              SizedBox(width: 6.w),
              Text(data).semiBoldText(AppColors.color3332CA, 14.sp),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
    ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp);
  }

  Widget _buildTab(String text, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,

          child: Column(
            children: [
              Text(text).semiBoldText(
                AppColors.color333333.withValues(alpha: 0.8),
                14.sp,
              ),
              SizedBox(height: 10.h),
              if (isSelected)
                Container(height: 4.h, color: AppColors.color293359),
            ],
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Column(
      children: [
        AppSpacing.h10,
        Container(
          height: 1.h,
          width: double.maxFinite,
          color: AppColors.colorCCCCCC,
        ),
        AppSpacing.h10,
      ],
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150.w,
            child: Text(title).semiBoldText(
              AppColors.color333333.withValues(alpha: 0.8),
              AppDimensions.d13.sp,
            ),
          ),
          Expanded(
            child: Text(
              value,
            ).regularText(AppColors.color333333.withValues(alpha: 0.8), 13.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusStep({
    required String icon,
    required String title,
    required VoidCallback onTap,
    bool isActive = false,
    bool isCompleted = false,
    String? actionText,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 72.h,
              width: 72.w,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.colorF5F5F5,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: isActive ? AppColors.colorD9D9D9 : Colors.transparent,
                  width: 1,
                ),
              ),
              child: ImageView(
                path: icon,
                height: 40.h,
                width: 40.w,
                color: isActive
                    ? AppColors.color293359
                    : AppColors.color293359.withValues(alpha: 0.2),
              ),
            ),
            if (isCompleted)
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  height: 23.h,
                  width: 23.w,
                  decoration: BoxDecoration(
                    color: AppColors.color31974C,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.check, size: 15, color: AppColors.white),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(title).boldText(
          isActive
              ? AppColors.color555555
              : AppColors.color555555.withValues(alpha: 0.3),
          10.sp,
        ),
        if (isActive && actionText != null) ...[
          SizedBox(height: 2.h),
          GestureDetector(
            onTap: onTap,
            child: Text(
              actionText,
              style: TextStyle(
                color: AppColors.color3332CA,
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildLine() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 8.w),
      child: Container(height: 4.h, width: 30.w, color: Colors.grey.shade300),
    );
  }

  ///_____________________________________________________________

  /// sales Details
  Widget sales(context, JobInfoController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.colorF5F5F5,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Estimated").regularText(
                AppColors.color333333.withValues(alpha: 0.8),
                14.sp,
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$1000.00").semiBoldText(
                    AppColors.color333333.withValues(alpha: 0.8),
                    24.sp,
                  ),
                  _buildEditButton(() {
                    showDialog(
                      context: context,
                      builder: (_) => const AddEstimateDialog(),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Text("Estimate History").semiBoldText(AppColors.color333333, 12.sp),
        SizedBox(height: 16.h),
        _buildHistoryRow("10/10/2025", "Alex Yurkov", "\$1000.00"),
        SizedBox(height: 16.h),
        _buildHistoryRow("10/10/2025", "Alex Yurkov", "\$100.00"),
        SizedBox(height: 40.h),
        Container(
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: AppColors.colorF5F5F5,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Parts & Materials").semiBoldText(
                AppColors.color333333.withValues(alpha: 0.8),
                14.sp,
              ),
              SizedBox(height: 6.h),
              _buildEditButton(() {
                showDialog(
                  context: context,
                  builder: (_) => const EditPartsDialog(),
                );
              }),
            ],
          ),
        ),
        Container(
          height: 1.h,
          width: double.maxFinite,
          color: AppColors.colorD9D9D9,
        ),
        SizedBox(height: 16.h),
        _buildMaterialRow("Pipes", "\$70.00", "x2", "\$140.00"),
        SizedBox(height: 16.h),
        _buildMaterialRow("Pipes", "\$70.00", "x2", "\$140.00"),
        SizedBox(height: 24.h),
        addApplianceButton('Add Parts & Materials', () {
          showDialog(
            context: context,
            builder: (_) => const AddMaterialsDialog(),
          );
        }),
        SizedBox(height: 40.h),
        Container(
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: AppColors.colorF5F5F5,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Payments").semiBoldText(
                AppColors.color333333.withValues(alpha: 0.8),
                14.sp,
              ),
              SizedBox(height: 6.h),
              SizedBox(height: 6.h),
              _buildEditButton(() {
                showDialog(
                  context: context,
                  builder: (_) => const EditPaymentsDialog(),
                );
              }),
            ],
          ),
        ),
        Container(
          height: 1.h,
          width: double.maxFinite,
          color: AppColors.colorD9D9D9,
        ),
        SizedBox(height: 24.h),
        payment(AppImages.icImage, "Cash"),
        SizedBox(height: 24.h),
        payment(AppImages.icMasterCard, "Credit Card"),
        SizedBox(height: 24.h),
        payment(AppImages.icImage, "Check"),
        SizedBox(height: 24.h),
        addApplianceButton('Add New Payment', () {
          showDialog(
            context: context,
            builder: (_) => addNewPaymentDialog(context),
          );
        }),
        SizedBox(height: 40.h),
        Container(
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: AppColors.colorF5F5F5,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sales").semiBoldText(
                AppColors.color333333.withValues(alpha: 0.8),
                14.sp,
              ),
              SizedBox(height: 6.h),
              _buildEditButton(() {
                showDialog(
                  context: context,
                  builder: (_) => const EditSaleDialog(),
                );
              }),
            ],
          ),
        ),
        Container(
          height: 1.h,
          width: double.maxFinite,
          color: AppColors.colorD9D9D9,
        ),
        SizedBox(height: 16.h),
        _buildMaterialRow(
          "Service",
          "\$70.00",
          "x2",
          "\$1000.00",
          widget: GestureDetector(
            onTap: controller.updateDescription,
            child: Container(
              padding: EdgeInsets.all(controller.isShowDescription ? 3 : 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.transparent,
                border: Border.all(
                  color: controller.isShowDescription
                      ? AppColors.color293359
                      : AppColors.colorD9D9D9,
                  width: controller.isShowDescription ? 2 : 1,
                ),
              ),
              child: Row(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: index == 2 ? 0 : 2.w),
                    child: Container(
                      height: 4.h,
                      width: 4.w,
                      decoration: BoxDecoration(
                        color: controller.isShowDescription
                            ? AppColors.color293359
                            : AppColors.color555555,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (controller.isShowDescription) ...{
          SizedBox(height: 24.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.w30,
              Text("Description: ").semiBoldText(
                AppColors.color333333.withValues(alpha: 0.8),
                10.sp,
              ),
              AppSpacing.w10,
              Expanded(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.color949494,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        },

        SizedBox(height: 24.h),
        addApplianceButton('Add New Sale', () {
          showDialog(
            context: context,
            builder: (_) => const AddNewSaleDialog(),
          );
        }),
        SizedBox(height: 40.h),
        Container(
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: AppColors.colorF5F5F5,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Review Total Summation Cost").semiBoldText(
                AppColors.color333333.withValues(alpha: 0.8),
                14.sp,
              ),
              SizedBox(height: 6.h),
            ],
          ),
        ),
        Container(
          height: 1.h,
          width: double.maxFinite,
          color: AppColors.colorD9D9D9,
        ),
        SizedBox(height: 16.h),
        cost("Subtotal", "\$0.00"),
        SizedBox(height: 16.h),
        cost("Discount", "\$0.00"),
        SizedBox(height: 16.h),
        cost("Total", "\$0.00"),
        SizedBox(height: 16.h),
        cost("Paid", "\$165.00"),
        SizedBox(height: 8.h),
        DottedLine(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          lineLength: double.infinity,
          lineThickness: 1.0,
          dashLength: 4.0,
          dashColor: AppColors.colorD9D9D9,
          dashRadius: 0.0,
          dashGapLength: 4.0,
          dashGapColor: Colors.transparent,
          dashGapRadius: 0.0,
        ),
        SizedBox(height: 8.h),
        cost("Due", "\$-165.00"),

        SizedBox(height: 40.h),
      ],
    );
  }

  Widget cost(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
        ).regularText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
        Text(
          price,
        ).regularText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
      ],
    );
  }

  Widget _buildEditButton(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 14.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.colorD9D9D9),
        ),
        child: Row(
          children: [
            Text("Edit").regularText(AppColors.color333333, 12.sp),
            SizedBox(width: 4.w),
            ImageView(path: AppImages.icEdit, color: AppColors.color333333),
          ],
        ),
      ),
    );
  }

  Widget payment(String image, String paymentType) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: AppDimensions.d56.h,
          width: AppDimensions.d56.w,
          decoration: BoxDecoration(
            color: AppColors.colorF5F5F5,
            borderRadius: BorderRadius.circular(AppDimensions.d8.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ImageView(path: image ?? AppImages.icImage)],
          ),
        ),
        AppSpacing.w24,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Alex Yurkov").boldText(AppColors.color333333, 12.sp),
            AppSpacing.h4,
            Text(paymentType).regularText(AppColors.color293359, 10.sp),
            AppSpacing.h10,
            Text("10/10/2025").regularText(AppColors.color949494, 10.sp),
          ],
        ),
        Spacer(),
        Text("\$1000.00").regularText(AppColors.color293359, 12.sp),
      ],
    );
  }

  Widget _buildHistoryRow(String date, String name, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$date       $name").regularText(AppColors.color333333, 12.sp),
        Text(amount).regularText(AppColors.color333333, 12.sp),
      ],
    );
  }

  Widget _buildMaterialRow(
    String title,
    String price,
    String qty,
    String total, {
    Widget? widget,
  }) {
    return Row(
      children: [
        ImageView(path: AppImages.icBox, height: 23.h, width: 23.w),
        SizedBox(width: 8.w),
        Text(title).boldText(AppColors.color333333, AppDimensions.d12.sp),
        SizedBox(width: 15.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSmallText("Price", price),
                  _buildSmallText("Quantity", qty),
                  _buildSmallText("Total", total),
                ],
              ),
            ],
          ),
        ),
        widget ?? Container(),
      ],
    );
  }

  Widget _buildSmallText(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).regularText(AppColors.color949494, AppDimensions.d10.sp),
        Text(value).semiBoldText(AppColors.color333333, AppDimensions.d12.sp),
      ],
    );
  }

  ///_______\
  ///jobFiles
  Widget jobFiles(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Job Files",
        ).semiBoldText(AppColors.color555555, AppDimensions.d14.sp),
        SizedBox(height: 8.h),
        Text(
          "Please add invoice payment picture or screenshot and parts receipt.",
        ).regularText(AppColors.color949494, AppDimensions.d10.sp),
        SizedBox(height: 24.h),
        DottedBorder(
          options: RoundedRectDottedBorderOptions(
            dashPattern: [10, 10],
            strokeWidth: 3,
            radius: Radius.circular(16.r),
            color: AppColors.colorD9D9D9,
          ),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const AddNoteDialog(),
              );
            },
            child: Container(
              height: 194.h,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_outlined,
                    color: AppColors.color3332CA,
                    size: 20.sp,
                  ),
                  SizedBox(height: 15.h),
                  Text("Add New").semiBoldText(AppColors.color3332CA, 14.sp),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
