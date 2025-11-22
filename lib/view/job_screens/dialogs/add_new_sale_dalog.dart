import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';
import 'package:home_alliance/widgets/drop_down.dart';

import '../../../helper/decoration.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_spacing.dart';

class AddNewSaleDialog extends StatelessWidget {
  const AddNewSaleDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text("Add New Sale").semiBoldText(
                AppColors.color333333.withValues(alpha: 0.8),
                14.sp,
              ),
              divider(),
              AppSpacing.h24,

              MyDropDownWidget(itemList: ["Service", "Sales"], hint: "Service"),

              const SizedBox(height: 24),

              /// DESCRIPTION LABEL
              const Text(
                "Description",
              ).regularText(AppColors.color333333, 10.sp),

              const SizedBox(height: 8),

              /// DESCRIPTION FIELD
              _multilineInputField("Provide a description"),

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
                                AppColors.color949494,AppDimensions.d14,),
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

              const SizedBox(height: 32),

              /// SAVE BUTTON (FULL WIDTH RIGHT ALIGNED)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 9.h,
                      horizontal: 41.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.color293359,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text("Save").boldText(AppColors.white, 14.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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

  BoxDecoration _fieldDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.colorD9D9D9),
    );
  }
}
