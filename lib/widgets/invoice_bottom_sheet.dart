import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/route_strings.dart';

class AddItemBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            // Title
            Center(
              child: Text(
                "Add Item Service",
              ).regularText(AppColors.black, 14.sp),
            ),
            SizedBox(height: 30.h),

            // Item Service Field
            Text("Edit Item Service").regularText(AppColors.black, 14.sp),
            SizedBox(height: 13.h),
            TextField(
              decoration: InputDecoration(
                hintText: "ex. 12 inch pipe",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: AppColors.colorCCCCCC,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: AppColors.colorCCCCCC,
                    width: 1,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
            ),
            SizedBox(height: 30.h),

            // Quantity + Price
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quantity").regularText(AppColors.black, 14.sp),
                      SizedBox(height: 13.h),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "1",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(
                              color: AppColors.colorCCCCCC,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(
                              color: AppColors.colorCCCCCC,
                              width: 1,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price").regularText(AppColors.black, 14.sp),
                      SizedBox(height: 13.h),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 12.w, right: 4.w),
                            child: Text(
                              "\$",
                              style: TextStyle(
                                color: AppColors.color333333.withOpacity(0.6),
                              ),
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          hintText: "0.00",
                          hintStyle: TextStyle(
                            color: AppColors.color333333.withOpacity(0.6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(
                              color: AppColors.colorCCCCCC,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(
                              color: AppColors.colorCCCCCC,
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 70.h),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 110.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.colorCCCCCC),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Center(
                      child: Text("Cancel").regularText(
                        AppColors.color333333.withValues(alpha: 0.8),
                        14.sp,
                        align: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteString.createInvoicePreview);
                  },
                  child: Container(
                    width: 110.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.color293359,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Center(
                      child: Text("Save").boldText(
                        AppColors.white,
                        14.sp,
                        align: TextAlign.center,
                      ),
                    ),
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
