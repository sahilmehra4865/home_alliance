import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_spacing.dart';
import '../../../widgets/drop_down.dart';

class AddApplianceDialog extends StatefulWidget {
  const AddApplianceDialog({super.key});

  @override
  State<AddApplianceDialog> createState() => _AddApplianceDialogState();
}

class _AddApplianceDialogState extends State<AddApplianceDialog> {
  @override
  Widget build(BuildContext context) {
    final List<String> brands = ["Samsung", "LG", "Whirlpool"];
    final List<String> appliances = ["AC", "Fridge", "Washing Machine"];
    String? selectedAppliances;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add New Appliance",
            ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
            divider(),
            AppSpacing.h24,

            /// Appliance Type label
            Text("Appliance Type").regularText(AppColors.color333333, 10.sp),

            const SizedBox(height: 8),

            /// Appliance dropdown
            MyDropDownWidget(itemList: appliances, hint: 'Appliance'),

            const SizedBox(height: 24),

            /// Brand label
            /// Appliance Type label
            Text("Brand Type").regularText(AppColors.color333333, 10.sp),

            const SizedBox(height: 8),
            MyDropDownWidget(itemList: brands, hint: 'Brand'),

            AppSpacing.h24,

            /// Add Button Right Aligned
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
    );
  }
}
