import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_alliance/utils/app_extensions.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_spacing.dart';
import '../../utils/route_strings.dart';
import '../../widgets/image_view.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          Container(
            color: AppColors.colorF5F5F5.withValues(alpha: 0.95),
            height: 278.h,
            width: double.maxFinite,
            child: Stack(
              children: [
                ImageView(
                  height: 278.h,
                  width: double.maxFinite,
                  path: AppImages.icBg,
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    SizedBox(height: 55.h),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: CommonWidgets.appBarCenterTitle(
                          "Rewards",
                          suffix: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Get.toNamed(RouteString.importantScreen);
                            },
                            child: ImageView(path: AppImages.icQMark),
                          ),
                        ),
                      ),
                    ),
                    AppSpacing.h20,
                    Column(
                      children: [
                        Text(
                          "Available to Withdraw",
                        ).regularText(AppColors.color333333, 12.sp),
                        SizedBox(height: 6.h),

                        Text(
                          "\$1,523.00",
                        ).semiBoldText(AppColors.color333333, 40.sp),

                        SizedBox(height: 20.h),
                        Container(
                          width: 115.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Withdraw",
                            ).regularText(Colors.white, 14.sp),
                          ),
                        ),

                        SizedBox(height: 10.h),

                        Text(
                          "min. \$150.00",
                        ).regularText(AppColors.color333333, 12.sp),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                // TWO CARDS ROW
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        title: "Signed Members",
                        value: "5",
                        icon: Icons.group,
                        isSignedMembers: true,
                      ),
                    ),
                    SizedBox(width: 48.w),
                    Expanded(
                      child: _StatCard(
                        title: "Number of\nEligible Orders",
                        value: "3",
                        icon: Icons.receipt_long,
                        isSignedMembers: false,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.h),

                // HEADER TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Membership Rewards",
                    ).semiBoldText(AppColors.color333333.withValues(alpha: 0.8), 14.sp),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteString.howToEarn);
                        },
                        child: Icon(Icons.info_outline, color: AppColors.color333333.withValues(alpha: 0.8))),
                  ],
                ),

                SizedBox(height: 16.h),

                // Subscription Rewards Card
                _RewardCard(
                  amount: "\$228.95",
                  text: "Commission from Subscriptions",
                  image: AppImages.icPeople,
                ),

                SizedBox(height: 12.h),

                // Orders Rewards Card
                _RewardCard(
                  amount: "\$426.20",
                  text: "Commission from Orders",
                  image: AppImages.icRecept,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// SMALL STAT CARD
class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final bool isSignedMembers;
  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.isSignedMembers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 117.h,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ).boldText(AppColors.color555555, 24.sp),
                    AppSpacing.w8,
                    isSignedMembers?AvatarStack(
                      images: [
                        AppImages.icDummy,
                        AppImages.icDummy,
                        AppImages.icDummy,
                        AppImages.icDummy,
                      ],
                      extraCount: 5,
                      size: 24,
                      overlap: 12,
                    ):ImageView(
                      path: AppImages.icNote,
                      height: 18.h,
                      width: 18.w,
                    )
                  ],
                ),
                AppSpacing.h13,
                Text(title).regularText(AppColors.color555555, 12.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarStack extends StatelessWidget {
  final List<String> images;
  final int extraCount; // e.g. 5 for "+5"
  final double size; // avatar diameter
  final double overlap; // how much avatars overlap (0..size)

  const AvatarStack({
    Key? key,
    required this.images,
    this.extraCount = 0,
    this.size = 44.0,
    this.overlap = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int visibleCount = images.length;
    final int totalItems = visibleCount + (extraCount > 0 ? 1 : 0);
    final double step = size - overlap;
    final double width = totalItems > 0 ? (step * (totalItems - 1) + size) : 0;

    return SizedBox(
      width: width,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < visibleCount; i++)
            Positioned(left: i * step, child: _borderedAvatar(images[i], size)),
          if (extraCount > 0)
            Positioned(
              left: visibleCount * step,
              child: _countCircle(extraCount, size),
            ),
        ],
      ),
    );
  }

  Widget _borderedAvatar(String image, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.colorD9D9D9, width: 1),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: ClipOval(
        child: ImageView(
          path: image,
          fit: BoxFit.cover,
          width: size,
          height: size,
        ),
      ),
    );
  }

  Widget _countCircle(int count, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 3),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Center(
        child: Text(
          '+$count',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black87,
            fontSize: size * 0.38,
          ),
        ),
      ),
    );
  }
}

/// LARGE REWARD CARD
class _RewardCard extends StatelessWidget {
  final String amount;
  final String text;
  final String image;

  const _RewardCard({
    required this.amount,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(colors: [Colors.white, AppColors.colorF5F5F5])
      ),
      child: Row(
        children: [
          // Amount + description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      amount,
                    ).boldText(AppColors.color555555, 24.sp),
                    AppSpacing.w12,
                    ImageView(path: AppImages.icQMark,color: AppColors.colorD9D9D9,),
                  ],
                ),
                Text(
                  text,
                ).regularText(AppColors.color555555, 12.sp),
              ],
            ),
          ),

         // SizedBox(width: 12),

          // Right Icon
          ImageView(
            path: image,
          )
        ],
      ),
    );
  }
}
