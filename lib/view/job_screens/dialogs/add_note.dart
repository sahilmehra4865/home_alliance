import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/view/job_screens/dialogs/reject_dailog.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_spacing.dart';

class AddNoteDialog extends StatefulWidget {
  const AddNoteDialog({super.key});

  @override
  State<AddNoteDialog> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  final TextEditingController _controller = TextEditingController();
  int _wordCount = 0;

  void _updateWordCount(String text) {
    setState(() {
      _wordCount = text.trim().isEmpty
          ? 0
          : text.trim().split(RegExp(r'\s+')).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Note",
            ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
            divider(),
            AppSpacing.h16,

            // TextField
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.colorD9D9D9),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    onChanged: _updateWordCount,
                    maxLines: 5,
                    maxLength: 200,
                    decoration: InputDecoration(
                      hintText: "What do you have in mind?",
                      hintStyle: TextStyle(
                        color: AppColors.color333333.withValues(alpha: 0.2),
                      ),
                      counterText: "",
                      contentPadding: EdgeInsets.all(0),
                      border: InputBorder.none,
                    ),
                  ),
                  // Word count
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text("${_wordCount}/200 words").regularText(
                      AppColors.color333333.withValues(alpha: 0.2),
                      14.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

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
                  onTap: _wordCount != 0
                      ? () {
                          // Handle submit
                          Navigator.pop(context);
                        }
                      : null,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 9.h,
                      horizontal: 32.w,
                    ),
                    decoration: BoxDecoration(
                      color: _wordCount != 0
                          ? AppColors.color3332CA
                          : AppColors.colorD9D9D9,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text("Submit").regularText(AppColors.white, 14.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
