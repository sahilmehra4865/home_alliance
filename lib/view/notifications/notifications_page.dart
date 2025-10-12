import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/widgets/scroll_behaviour.dart';

import '../../helper/common_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_dimension.dart';
import '../../utils/app_images.dart';
import '../../utils/app_spacing.dart';
import '../../widgets/image_view.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        "title": "Consectetur adipiscing elit",
        "unread": true,
        "icon": AppImages.icBox,
      },
      {
        "title": "Consectetur adipiscing elit",
        "unread": true,
        "icon": AppImages.icTool,
      },
      {
        "title": "Lorem ipsum dolor sit amet",
        "unread": true,
        "icon": AppImages.icBox,
      },
      {
        "title": "Consectetur adipiscing elit",
        "unread": false,
        "icon": AppImages.icBox,
      },
      {"title": "Sit amet!", "unread": false, "icon": AppImages.icBox},
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CommonWidgets.appBar("notifications"),
          ),

          AppSpacing.h5,
          Expanded(
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: ListView.separated(
                itemCount: notifications.length,
                padding: EdgeInsets.only(bottom: 10.h,top: 30.h),
                separatorBuilder: (_, __) => Container(),
                itemBuilder: (context, index) {
                  final item = notifications[index];
                  return Column(
                    children: [
                      Padding(
                        padding: item["unread"] == true
                            ? EdgeInsets.only(
                                top: 15.h,
                                bottom: 15.h,
                                left: 0.w,
                                right: 22.w,
                              )
                            : EdgeInsets.symmetric(
                                vertical: 15.h,
                                horizontal: 22.w,
                              ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (item["unread"] == true) ...[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                ),
                                child: Icon(
                                  Icons.circle,
                                  size: 5,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                            ImageView(path: item["icon"] as String),
                            AppSpacing.w24,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item["title"] as String).boldText(
                                    AppColors.color333333,
                                    AppDimensions.d16.sp,
                                  ),
                                  AppSpacing.h8,
                                  const Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent luctus, urna vel lacinia auctor",
                                  ).regularText(
                                    AppColors.color333333.withValues(
                                      alpha: 0.6,
                                    ),
                                    AppDimensions.d16.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                          horizontal: 22.w,
                        ),
                        child: Divider(color: AppColors.colorCCCCCC),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
