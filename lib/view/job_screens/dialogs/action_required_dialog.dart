import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_spacing.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../widgets/image_view.dart';
import '../job_info_controller.dart';
import 'left_status_dialog.dart';

Future<void> showActionRequiredDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => const ActionRequiredDialog(),
  );
}

class ActionRequiredDialog extends StatelessWidget {
  const ActionRequiredDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobInfoController controller = Get.find<JobInfoController>();
    final double circleRadius = 56;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Dialog body
          Container(
            margin: EdgeInsets.only(top: circleRadius / 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                AppSpacing.h12,
                // Title + close icon row
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Action Required',
                    ).boldText(AppColors.color293359, 24.sp),
                    SizedBox(height: 8.h),
                    Text(
                      'Make sure to follow the correct process',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ).regularText(AppColors.colorAAAAAA, 12.sp),
                  ],
                ),
                const SizedBox(height: 40),
                // Steps row
                Row(
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
                        //controller.jobStatus = 1;
                       // controller.update();
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
                const SizedBox(height: 16),
                acknowledgementRichText(),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // handle acknowledge action
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF162B55),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'I Acknowledge',
                    ).boldText(
                      AppColors.white,
                      16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Overlapping circular icon
          Positioned(
            top: -23,
            child: Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: ImageView(
                  path: AppImages.icAlert,
                  height: 70.h,
                  width: 70.w,
                ),
              ),
            ),
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
      child: Container(height: 4.h, width: 16.w, color: Colors.grey.shade300),
    );
  }
}

Widget acknowledgementRichText() {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors.color949494,
        height: 1.4,
      ),
      children: [
        const TextSpan(text: 'I acknowledge the mandatory process: Press '),
        TextSpan(
          text: '"On My Way"',
          style: TextStyle(
            color: AppColors.color293359,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
        const TextSpan(text: ' (before departure), '),
        TextSpan(
          text: '"Arrived"',
          style: TextStyle(
            color: AppColors.color293359,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
        const TextSpan(text: ' (at the location), and '),
        TextSpan(
          text: '"Left"',
          style: TextStyle(
            color: AppColors.color293359,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
        const TextSpan(text: ' (after completion) for every job.'),
      ],
    ),
  );
}

// dart

class StepItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const StepItem({
    Key? key,
    required this.icon,
    required this.label,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bg = selected ? Colors.white : Colors.grey.shade100;
    final border = selected
        ? Border.all(color: const Color(0xFF162B55), width: 1.5)
        : null;
    final iconColor = selected ? const Color(0xFF162B55) : Colors.grey;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(12),
            border: border,
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : null,
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.black : Colors.grey[700],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
