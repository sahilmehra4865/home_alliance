import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/helper/decoration.dart';
import 'package:home_alliance/utils/app_extensions.dart';

import '../utils/app_colors.dart';

class MyDropDownWidget extends StatefulWidget {
  final List<String> itemList;
  final String hint;
  final Function(String)? selectedValue;
  const MyDropDownWidget({
    super.key,
    required this.itemList,
    required this.hint,
    this.selectedValue,
  });

  @override
  State<MyDropDownWidget> createState() => _MyDropDownWidgetState();
}

class _MyDropDownWidgetState extends State<MyDropDownWidget> {
  bool isOpen = false; // track dropdown open state
  String? selectedAppliances;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: isOpen
                ? Colors.blue
                : AppColors.colorD9D9D9, // change color on open
            width: 1, // same width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: isOpen ? AppColors.color555555 : AppColors.colorD9D9D9,
            width: 1,
          ),
        ),
      ),

      hint: Text(widget.hint).regularText(AppColors.color949494, 14.sp),
      style: ViewDecoration.textStyle(
        14.sp,
        AppColors.color555555,
        FontWeight.w400,
      ),

      items: widget.itemList
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //  const SizedBox(height: 14),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 14.h),
                    child: Text(item).regularText(AppColors.color555555, 14.sp,maxLines: 1),
                  ),
                //  const SizedBox(height: 14),

                  // Divider inside dropdown list
                  Container(height: 1, color: AppColors.colorD9D9D9),
                ],
              ),
            ),
          )
          .toList(),
      // 👇 Selected value shows ONLY text (NO divider)
      selectedItemBuilder: (context) {
        return widget.itemList.map((item) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(item).regularText(AppColors.color555555, 14.sp),
          );
        }).toList();
      },

      onChanged: (value) {
        selectedAppliances = value;
        widget.selectedValue!(value!);
      },

      onMenuStateChange: (bool open) {
        setState(() {
          isOpen = open; // update arrow + border color
        });
      },

      iconStyleData: IconStyleData(
        icon: Icon(
          isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: AppColors.color333333,
        ),
        iconSize: 22,
      ),

      // buttonStyleData: const ButtonStyleData(
      //   padding: EdgeInsets.only(right: 8),
      // ),
      dropdownStyleData: DropdownStyleData(
        offset: const Offset(0, -4),
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: BoxBorder.all(color: AppColors.colorD9D9D9),
        ),
      ),

      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(vertical: 0),
      ),
    );
  }
}
