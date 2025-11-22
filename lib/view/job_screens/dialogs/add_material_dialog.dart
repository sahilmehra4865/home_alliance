import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';
import 'package:home_alliance/widgets/drop_down.dart';

import '../../../helper/decoration.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_spacing.dart';

class AddMaterialsDialog extends StatelessWidget {
  const AddMaterialsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Materials",
              ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
              divider(),
              AppSpacing.h24,


              /// Title
              _label("Parts Name"),
              AppSpacing.h8,
              _inputField("Provide Name of Part"),

              const SizedBox(height: 24),

              _label("Description"),
              AppSpacing.h8,
              _multilineInputField(
                "Provide a quote if the work you need does not fit into one of our standard categories",
              ),

              const SizedBox(height: 24),

              _label("Purchased by:"),
              AppSpacing.h8,
              _dropDownField(),

              const SizedBox(height: 24),

              Text(
                "Please provide as much detail as possible, including pictures",
              ).regularText(AppColors.color949494, 14.sp),

              const SizedBox(height: 20),

              /// Quantity - Price - Total Row
              Row(
                children: [
                  _smallInput("Quantity", "1", flex: 2),
                  const SizedBox(width: 10),
                  Padding(padding: EdgeInsets.only(top: 20),child: Text("×"),),
                  const SizedBox(width: 10),
                  _smallInput("Price", "0.00", flex: 3),
                  const SizedBox(width: 10),
                  Padding(padding: EdgeInsets.only(top: 20),child: Text("="),),
                  const SizedBox(width: 10),
                  _smallInput("Total", "\$0.00", flex: 3),
                ],
              ),

              const SizedBox(height: 30),

              /// Add Button
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
                    child: Text("Add").boldText(AppColors.white, 14.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ************** HELPER UI WIDGETS ************** ///

  Widget _label(String text) {
    return Text(
      text,
    ).regularText(AppColors.color555555, 10.sp);
  }

  Widget _inputField(String hint) {
    return  Container(
    height: 40.h,
    padding: EdgeInsets.symmetric(horizontal: 12.w),

      decoration: _fieldDecoration(),
      child: Center(
        child: TextField(

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
      ),
    );
  }

  Widget _multilineInputField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,),
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
          hintStyle:   ViewDecoration.textStyle(
          AppDimensions.d14,
          AppColors.color949494,
          FontWeight.w400,
        ),
        ),
      ),
    );
  }

  Widget _dropDownField() {
    return  MyDropDownWidget(itemList: ["Tech parts", "Customer", "Company"], hint: "Tech parts");

  }

  Widget _smallInput(String label, String hint, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label).regularText(AppColors.color555555, 10.sp),
          const SizedBox(height: 8),
          Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 12,),
            decoration: _fieldDecoration(),
            child: TextField(
              keyboardType: TextInputType.number,
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
          ),
        ],
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
