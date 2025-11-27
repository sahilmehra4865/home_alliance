import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';
import 'package:home_alliance/widgets/drop_down.dart';

import '../../../helper/decoration.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_spacing.dart';
import '../../../widgets/image_view.dart';

Widget addNewPaymentDialog(BuildContext context) {
  String selectedValue = "Credit Card";
  bool selected = false;
  bool isFailed = true;
  return StatefulBuilder(
    builder: (context, setState) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text("Add New Payment").semiBoldText(
                  AppColors.color333333.withValues(alpha: 0.8),
                  14.sp,
                ),
                divider(),
                AppSpacing.h24,

                /// Appliance Type label
                Text(
                  "Appliance Type",
                ).regularText(AppColors.color333333, 10.sp),

                const SizedBox(height: 8),

                // Amount + Transaction Row
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amount",
                          ).regularText(AppColors.color333333, 10.sp),

                          const SizedBox(height: 8),
                          Container(
                            height: 48.h,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: Row(
                              children: [
                                Text("\$").regularText(
                                  AppColors.color949494,
                                  AppDimensions.d14,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    style: ViewDecoration.textStyle(
                                      AppDimensions.d14,
                                      AppColors.color555555,
                                      FontWeight.w400,
                                    ),

                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "0.00",
                                      hintStyle: ViewDecoration.textStyle(
                                        AppDimensions.d14,
                                        AppColors.color949494,
                                        FontWeight.w400,
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),

                    // Transaction Dropdown
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transaction",
                          ).regularText(AppColors.color333333, 10.sp),

                          const SizedBox(height: 8),
                          MyDropDownWidget(
                            itemList: ["Credit Card", "Check", "Cash"],
                            hint: "Credit Card",
                            selectedValue: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                if (selectedValue == "Credit Card") ...{
                  creditCard(),
                } else ...{
                  if (selected == true) ...{
                    selectedValue == "Check"
                        ? FileUploadTile(
                            fileName: "Check.png",
                            progress: 178.5 / 200,
                            sizeLabel: "178.5 MB / 200 MB",
                            onDelete: () {
                              setState(() {
                                selected = false;
                              });
                            },
                            isFailed: isFailed,
                            onReload: () {
                              setState(() {
                                isFailed = false;
                              });
                            },
                          )
                        : ImagePreviewTile(
                            imagePath: AppImages.icCash,
                            onDelete: () {
                              setState(() {
                                selected = false;
                              });
                            },
                          ),
                  } else ...{
                    addCashImage(selectedValue == "Check", () {
                      setState(() {
                        selected = true;
                      });
                    }),
                  },
                },

                SizedBox(height: 24),

                // Buttons Row
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 9.h,
                          horizontal: 32.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.colorCCCCCC),
                        ),
                        child: Text(
                          "Cancel",
                        ).regularText(AppColors.color555555, 14.sp),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Handle submit
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 9.h,
                          horizontal: 32.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.colorD9D9D9,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text("Save").boldText(AppColors.white, 14.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget addCashImage(bool isCheck, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: DottedBorder(
      options: RoundedRectDottedBorderOptions(
        dashPattern: [10, 10],
        strokeWidth: 3,
        radius: Radius.circular(16.r),
        color: AppColors.colorD9D9D9,
      ),
      child: Container(
        height: 190.h,
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
              Icons.file_upload_outlined,
              size: 24.sp,
              color: AppColors.color555555,
            ),
            SizedBox(height: 12.h),

            Text("Upload Image").regularText(AppColors.color555555, 14.sp),

            SizedBox(height: 6.h),

            Text(
              isCheck
                  ? "Please take picture of check"
                  : "Please take picture of cash",
            ).regularText(AppColors.color949494, 10.sp),
          ],
        ),
      ),
    ),
  );
}

Widget creditCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Card Number
      Text("Card Number").regularText(AppColors.color333333, 10.sp),

      const SizedBox(height: 8),
      Container(
        height: 48.h,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: TextField(
          style: ViewDecoration.textStyle(
            AppDimensions.d14,
            AppColors.color555555,
            FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: "XXXX-XXXX-XXXX",
            border: InputBorder.none,
            hintStyle: ViewDecoration.textStyle(
              AppDimensions.d14,
              AppColors.color949494,
              FontWeight.w400,
            ),
          ),
        ),
      ),

      SizedBox(height: 20),

      // Billing Address
      Text("Billing Address").regularText(AppColors.color333333, 10.sp),

      const SizedBox(height: 8),
      Container(
        height: 48.h,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: TextField(
          maxLines: 2,
          style: ViewDecoration.textStyle(
            AppDimensions.d14,
            AppColors.color555555,
            FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: "Lorem ipsum dolor sit amet...",
            border: InputBorder.none,
            hintStyle: ViewDecoration.textStyle(
              AppDimensions.d14,
              AppColors.color949494,
              FontWeight.w400,
            ),
          ),
        ),
      ),
    ],
  );
}

class FileUploadTile extends StatelessWidget {
  final String fileName;
  final double progress; // 0.0 – 1.0
  final String sizeLabel;
  final VoidCallback onDelete;
  final VoidCallback onReload;
  final bool isFailed;

  const FileUploadTile({
    super.key,
    required this.fileName,
    required this.progress,
    required this.sizeLabel,
    required this.onDelete,
    required this.isFailed,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.colorD9D9D9),
      ),
      child: Row(
        children: [
          Container(
            height: 38.h,
            width: 38.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.colorF5F5F5,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageView(path: AppImages.icImage),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fileName).boldText(
                  AppColors.color333333.withValues(alpha: 0.87),
                  14.sp,
                ),

                AppSpacing.h6,

                ClipRRect(
                  //  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 5,
                    backgroundColor: AppColors.colorD9D9D9,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isFailed ? AppColors.colorDD2E44 : AppColors.color364699,
                    ),
                  ),
                ),

                const SizedBox(height: 6),
                isFailed
                    ? Text("Failed").boldText(AppColors.colorDD2E44, 10.sp)
                    : Text(sizeLabel).boldText(
                        AppColors.color333333.withValues(alpha: 0.6),
                        10.sp,
                      ),
              ],
            ),
          ),
          AppSpacing.w10,
          if (isFailed)
            GestureDetector(
              onTap: onReload,
              child: Container(
                height: 32.h,
                width: 32.h,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.color333333.withValues(alpha: 0.1),
                  ),
                ),
                child: ImageView(path: AppImages.icReload),
              ),
            ),
          AppSpacing.w10,
          GestureDetector(
            onTap: onDelete,
            child: Container(
              height: 32.h,
              width: 32.h,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: AppColors.color333333.withValues(alpha: 0.1),
                ),
              ),
              child: ImageView(path: AppImages.icDelete),
            ),
          ),
        ],
      ),
    );
  }
}

class ImagePreviewTile extends StatelessWidget {
  final String imagePath;
  final VoidCallback onDelete;

  const ImagePreviewTile({
    super.key,
    required this.imagePath,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          // The main image
          ImageView(path: imagePath, fit: BoxFit.fill),

          // Delete button
          Positioned(
            top: 15,
            right: 15,
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                height: 32.h,
                width: 32.h,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.color333333.withValues(alpha: 0.1),
                  ),
                ),
                child: ImageView(path: AppImages.icDelete),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
