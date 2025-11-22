import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';
import 'package:home_alliance/widgets/drop_down.dart';
import 'package:home_alliance/widgets/image_view.dart';

import '../../../helper/decoration.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_images.dart';

class EditSaleDialog extends StatelessWidget {
  const EditSaleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER WITH ICON + TITLE + DELETE
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.colorF5F5F5,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: ImageView(path: AppImages.icBox)),
                ),

                AppSpacing.w8,

                /// TITLE TEXTS
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Edit Sale").regularText(AppColors.color555555, 12.sp),
                    SizedBox(height: 2),
                    Text(
                      "Service",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ).boldText(AppColors.color555555, 16.sp),
                  ],
                ),

                const Spacer(),

                const Icon(Icons.remove, color: Colors.red),
                const SizedBox(width: 8),
                const Text("Delete").semiBoldText(
                  AppColors.color333333.withValues(alpha: 0.8),
                  14.sp,
                ),
              ],
            ),

            divider(),
            AppSpacing.h24,
            MyDropDownWidget(itemList: ["Service", "Sales"], hint: "Service"),

            const SizedBox(height: 24),

            /// DESCRIPTION LABEL
            _label("Description"),
            AppSpacing.h8,
            _multilineInputField("Pretty Expensive"),
            const SizedBox(height: 24),

            /// QUANTITY + AMOUNT ROW
            Row(
              children: [
                /// QUANTITY
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Quantity",
                        style: TextStyle(fontSize: 14),
                      ).regularText(AppColors.color333333, 10.sp),

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

                const SizedBox(width: 18),

                /// AMOUNT
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Amount").regularText(AppColors.color333333, 10.sp),

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
              ],
            ),
            AppSpacing.h24,

            /// BUTTONS
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
                      borderRadius: BorderRadius.circular(5.r),
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
                      color: /*_wordCount != 0
                          ? AppColors.color3332CA
                          :*/ AppColors.colorD9D9D9,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text("Save").boldText(AppColors.white, 14.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ************** HELPER UI WIDGETS ************** ///

  Widget _label(String text) {
    return Text(text).regularText(AppColors.color555555, 10.sp);
  }

  BoxDecoration _fieldDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.colorD9D9D9),
    );
  }

  Widget _multilineInputField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: _fieldDecoration(),
      child: TextField(
        maxLines: 4,
        style: ViewDecoration.textStyle(
          AppDimensions.d14,
          AppColors.color555555,
          FontWeight.w400,
        ),
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: ViewDecoration.textStyle(
            AppDimensions.d14,
            AppColors.color949494,
            FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
