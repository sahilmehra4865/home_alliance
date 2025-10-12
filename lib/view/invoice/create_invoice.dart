import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/widgets/image_view.dart';
import 'package:home_alliance/widgets/scroll_behaviour.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_spacing.dart';

class CreateInvoicePage extends StatelessWidget {
  const CreateInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height:60.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CommonWidgets.appBar("Back"),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    AppSpacing.h32,
                    Text("Create Invoice").semiBoldText(AppColors.color333333, 22.sp),
                    SizedBox(height: 20.h),

                    // ✅ Dates Row
                    Row(
                      children: [
                        Expanded(child: _dateField("Invoice Date")),
                        SizedBox(width: 12.w),
                        Expanded(child: _dateField("Due Date")),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    // ✅ Client
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 14.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.colorCCCCCC),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Client",
                          ).boldText(AppColors.color333333.withValues(alpha: 0.6), 12.sp),
                          SizedBox(height: 10.h),
                          Text(
                            "Patricia Jimenez",
                          ).boldText(AppColors.color333333, 16.sp),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // ✅ Items Table
                    Container(
                      decoration: BoxDecoration(
                       // border: Border.all(color: Colors.grey.shade300),
                       // borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: [
                          _tableHeader(),
                          Divider(height: 1, color: AppColors.colorCCCCCC),
                          _tableRow("Pipes", "\$200", "2", "\$400"),
                          Divider(height: 1, color:AppColors.colorCCCCCC),
                          _tableRow("Sink Repair", "\$250", "1", "\$250"),
                          Divider(height: 1, color: AppColors.colorCCCCCC),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // ✅ Add Item Button
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: AppColors.color293359),
                      label: Text(
                        "Add Item"
                      ).boldText(AppColors.color293359, 14.sp),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 9.h),
                        side: BorderSide(color:AppColors.color293359),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // ✅ Extra Notes
                    Text(
                      "Extra Notes"
                    ).boldText(AppColors.color293359, 14.sp),
                    SizedBox(height: 10.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal:20.w),
                          height: 170.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.colorCCCCCC),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: TextField(
                            maxLines: 5,
                           // expands: true,
                            decoration: InputDecoration(
                              hintText: "Write anything",
                              hintStyle: TextStyle(
                                color: AppColors.color333333.withValues(alpha: 0.6),
                                fontSize: 14.sp
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            bottom: -35,
                            child: Container(
                          height:80.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.colorCCCCCC)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: ImageView(
                            path: AppImages.icMagic,
                                            ),
                          ),
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Reusable date field
  Widget _dateField(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.colorCCCCCC),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
          ).boldText(AppColors.color333333.withValues(alpha: 0.8), 12.sp),
          AppSpacing.h13,
          Row(
            children: [
              ImageView(path: AppImages.icCalendar),
              SizedBox(width: 8.w),
              Text("DD/MM/YYY").regularText(
                AppColors.color333333.withValues(alpha: 0.6),
                16.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ✅ Table header
  Widget _tableHeader() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorF5F5F5,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.r),topRight: Radius.circular(5.r)
        )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text("Item/Service").semiBoldText(AppColors.color333333, 12.sp)),
            Expanded(flex: 2, child: Text("Price").semiBoldText(AppColors.color333333, 12.sp)),
            Expanded(flex: 1, child: Text("Qty").semiBoldText(AppColors.color333333, 12.sp)),
            Expanded(flex: 2, child: Text("Total").semiBoldText(AppColors.color333333, 12.sp,)),
          ],
        ),
      ),
    );
  }

  // ✅ Table row
  Widget _tableRow(String item, String price, String qty, String total) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(item).regularText(AppColors.color333333, 12.sp)),
          Expanded(flex: 2, child: Text(price).regularText(AppColors.color333333, 12.sp)),
          Expanded(flex: 1, child: Text(qty).regularText(AppColors.color333333, 12.sp)),
          Expanded(flex: 2, child: Text(total).regularText(AppColors.color333333, 12.sp)),
        ],
      ),
    );
  }
}
