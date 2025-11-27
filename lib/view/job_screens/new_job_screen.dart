import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:home_alliance/utils/app_colors.dart';
import 'package:home_alliance/utils/app_extensions.dart';
import 'package:home_alliance/utils/app_spacing.dart';
import 'package:home_alliance/view/job_screens/new_jobs_controller.dart';
import 'package:home_alliance/widgets/image_view.dart';
import 'package:table_calendar/table_calendar.dart';
// language: dart
import 'dart:math' as math;
import '../../helper/common_widgets.dart';
import '../../utils/app_images.dart';

class NewJobScreen extends StatelessWidget {
  const NewJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewJobsController>(
      builder: (jobController) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                color: AppColors.colorF5F5F5.withValues(alpha: 0.95),
                height: 115.h,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    ImageView(
                      height: 110.h,
                      width: double.maxFinite,
                      path: AppImages.icBg,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          SizedBox(height: 60.h),
                          Row(
                            children: [
                              Text(
                                "Jobs",
                              ).boldText(AppColors.color333333, 24.sp),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: BoxBorder.all(
                                    color: AppColors.colorD9D9D9,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      ImageView(
                                        height: 20,
                                        width: 20,
                                        path: AppImages.icJobs,
                                        color: AppColors.color555555,
                                      ),
                                      AppSpacing.w8,
                                      Text(
                                        "5",
                                      ).boldText(AppColors.color555555, 16.sp),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSpacing.h20,
                            Text(
                              "Schedule",
                            ).regularText(AppColors.color333333, 16.sp),
                            AppSpacing.h20,
                            JobsCalendar(),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // if (jobController.selectedTab != 0) {
                                //   jobController.getJobs(true);
                                // }
                                jobController.selectedTab = 0;

                                jobController.update();
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Text(
                                      "Open Jobs",
                                      style: TextStyle(
                                        fontWeight:
                                            jobController.selectedTab == 0
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                        color: jobController.selectedTab == 0
                                            ? AppColors.color293359
                                            : AppColors.color333333,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 16.h),
                                      height: jobController.selectedTab == 0
                                          ? 3.h
                                          : 1.h,
                                      color: jobController.selectedTab == 0
                                          ? AppColors.color293359
                                          : AppColors.colorCCCCCC,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // if (jobController.selectedTab != 1) {
                                //   jobController.getJobs(false);
                                // }
                                jobController.selectedTab = 1;

                                jobController.update();
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Text(
                                      "Closed Jobs",
                                      style: TextStyle(
                                        fontWeight:
                                            jobController.selectedTab == 1
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                        color: jobController.selectedTab == 1
                                            ? AppColors.color293359
                                            : AppColors.color333333,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 16.h),
                                      height: jobController.selectedTab == 1
                                          ? 3.h
                                          : 1.h,
                                      color: jobController.selectedTab == 1
                                          ? AppColors.color293359
                                          : AppColors.colorCCCCCC,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 26.h),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return jobCard(jobController.selectedTab == 0);
                        },
                      ),
                      SizedBox(height: 26.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget jobCard(bool isOpenJob) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top Row: Open Job + Distance
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: AppColors.colorD9D9D9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isOpenJob
                              ? AppColors.colorFFC917
                              : AppColors.color31974C,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        isOpenJob ? "Open Job" : "Closed Job",
                      ).regularText(AppColors.color555555, 10.sp),
                    ],
                  ),
                ),

                /// Distance
                Row(
                  children: [
                    ImageView(path: AppImages.icLocation),
                    SizedBox(width: 4),
                    Text("25km away").regularText(
                      AppColors.color333333.withValues(alpha: 0.8),
                      10.sp,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// Job Title
            const Text(
              "Preventive Maintenance HVAC",
            ).boldText(AppColors.color555555, 14.sp),

            const SizedBox(height: 8),

            /// Address
            Text(
              "4118 Davana Rd, Los Angeles, CA",
            ).regularText(AppColors.color949494, 12.sp),

            const SizedBox(height: 12),

            /// Job Type
            Row(
              children: [
                Text("Job Type:").regularText(AppColors.color949494, 12.sp),
                const SizedBox(width: 4),
                const Text("Organic").regularText(AppColors.color31974C, 12.sp),
              ],
            ),

            const SizedBox(height: 16),

            /// Profile Section
            Row(
              children: [
                /// Circle initials avatar
                Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: BoxBorder.all(color: AppColors.colorD9D9D9),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "JS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ).boldText(AppColors.color333333, 14.sp),
                    ),
                    Positioned(
                      left: 24,
                      top: 24,
                      child: Icon(
                        Icons.verified,
                        color: AppColors.color42ADE2,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),

                /// Name + Date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "John Smith",
                        ).regularText(AppColors.color555555, 12.sp),
                        SizedBox(width: 6),

                        /// Verification icon
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text("Monday, Nov 1 2025").regularText(
                      isOpenJob ? AppColors.colorDD2E44 : AppColors.color555555,
                      10.sp,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JobsCalendar extends StatefulWidget {
  const JobsCalendar({super.key});

  @override
  State<JobsCalendar> createState() => _JobsCalendarState();
}

class _JobsCalendarState extends State<JobsCalendar> {
  DateTime _focusedDay = DateTime(2025, 11, 9);
  DateTime? _selectedDay = DateTime(2025, 11, 9);

  final Map<DateTime, List<String>> events = {
    DateTime(2025, 11, 9): ['job'],
    DateTime(2025, 11, 10): ['job'],
    DateTime(2025, 11, 15): ['job'],
    DateTime(2025, 11, 16): ['job'],
    DateTime(2025, 11, 17): ['job'],
    DateTime(2025, 11, 30): ['job'],
  };

  List _getEventsForDay(DateTime day) {
    return events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.color9A9A9A),
      ),
      child: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: DateTime(2020),
        lastDay: DateTime(2030),
        // eventLoader: _getEventsForDay,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextFormatter: (date, _) =>
              "${_monthName(date.month)} ${date.year}",
          titleTextStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.color333333.withValues(alpha: 0.85),
          ),
          leftChevronIcon: const Icon(Icons.chevron_left, size: 26),
          rightChevronIcon: const Icon(Icons.chevron_right, size: 26),
          headerPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 0,
          ),
        ),

        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: AppColors.colorA5A5A5,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
          weekendStyle: TextStyle(
            color: AppColors.colorA5A5A5,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        ),

        calendarStyle: CalendarStyle(
          outsideDaysVisible: true,
          // selectedDecoration/todayDecoration handled in builders
          selectedTextStyle: const TextStyle(color: Colors.white),
        ),
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selected, focused) {
          setState(() {
            _selectedDay = selected;
            _focusedDay = focused;
          });
        },
        // language: dart
        calendarBuilders: CalendarBuilders(
          // Default day cell
          defaultBuilder: (context, day, focusedDay) {
            final hasEvent = _getEventsForDay(day).isNotEmpty;
            final inMonth = day.month == focusedDay.month;
            final textColor = inMonth
                ? AppColors.color333333.withValues(alpha: 0.85)
                : Colors.grey.shade400;

            return Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: SizedBox(
                width: 44,
                child: Column(
                  children: [
                    Text(
                      '${day.day}',
                    ).regularText(AppColors.colorACACAC, 14.sp),
                    if (hasEvent)
                      DottedProgress(
                        size: 16,
                        dotCount: 5,
                        progress: .5, // full dotted ring
                        activeColor: AppColors.color3332CA,
                        inactiveColor: Colors.black.withValues(alpha: 0.2),
                        strokeWidth: 2,
                      ),
                  ],
                ),
              ),
            );
          },
          outsideBuilder: (context, day, focusedDay) {
            final hasEvent = _getEventsForDay(day).isNotEmpty;
            final inMonth = day.month == focusedDay.month;
            final textColor = inMonth
                ? AppColors.color333333.withValues(alpha: 0.85)
                : Colors.grey.shade400;

            return Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: SizedBox(
                width: 44,
                child: Column(
                  children: [
                    Text(
                      '${day.day}',
                    ).regularText(AppColors.colorECECEC, 14.sp),
                    if (hasEvent)
                      DottedProgress(
                        size: 16,
                        dotCount: 5,
                        progress: .5, // full dotted ring
                        activeColor: AppColors.color3332CA,
                        inactiveColor: Colors.black.withValues(alpha: 0.2),
                        strokeWidth: 2,
                      ),
                  ],
                ),
              ),
            );
          },

          // Selected day (rounded dark rect with small highlighted dotted ring)
          selectedBuilder: (context, day, focusedDay) {
            final hasEvent = _getEventsForDay(day).isNotEmpty;
            return Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: SizedBox(
                width: 44,
                // height: 56,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.color293359,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 3.h,
                        horizontal: 1,
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text('${day.day}').boldText(AppColors.white, 14.sp),
                          if (hasEvent)
                            DottedProgress(
                              size: 16,
                              dotCount: 5,
                              progress: .5, // full dotted ring
                              activeColor: AppColors.colorFFC917,
                              inactiveColor: Colors.white,
                              strokeWidth: 2,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },

          // Today style: muted with small grey dotted ring if event exists
          todayBuilder: (context, day, focusedDay) {
            final hasEvent = _getEventsForDay(day).isNotEmpty;
            final inMonth = day.month == focusedDay.month;
            final textColor = inMonth
                ? AppColors.color333333.withValues(alpha: 0.85)
                : Colors.grey.shade400;

            return Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: SizedBox(
                width: 44,
                child: Column(
                  children: [
                    Text(
                      '${day.day}',
                    ).regularText(AppColors.colorACACAC, 14.sp),
                    if (hasEvent)
                      DottedProgress(
                        size: 16,
                        dotCount: 5,
                        progress: .5, // full dotted ring
                        activeColor: AppColors.color3332CA,
                        inactiveColor: Colors.black.withValues(alpha: 0.2),
                        strokeWidth: 2,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _monthName(int m) {
    const months = [
      "",
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[m];
  }
}

class DottedProgress extends StatelessWidget {
  final double size;
  final int dotCount;
  final double progress; // 0.0 .. 1.0
  final Color activeColor;
  final Color inactiveColor;
  final double strokeWidth;

  const DottedProgress({
    Key? key,
    this.size = 24,
    this.dotCount = 12,
    this.progress = 0.0,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.strokeWidth = 2.0,
  }) : assert(progress >= 0 && progress <= 1),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _DottedProgressPainter(
            dotCount: dotCount,
            progress: progress,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            strokeWidth: strokeWidth,
          ),
        ),
      ),
    );
  }
}

class _DottedProgressPainter extends CustomPainter {
  final int dotCount;
  final double progress;
  final Color activeColor;
  final Color inactiveColor;
  final double strokeWidth;

  _DottedProgressPainter({
    required this.dotCount,
    required this.progress,
    required this.activeColor,
    required this.inactiveColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintActive = Paint()
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final paintInactive = Paint()
      ..color = inactiveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final radius = (math.min(size.width, size.height) / 2) - strokeWidth;
    final center = Offset(size.width / 2, size.height / 2);

    final gap = 2 * math.pi / dotCount;
    final dotArc = gap * 0.45; // arc length for each "dot" (adjust spacing)
    final startOffset = -math.pi / 2; // start at top

    final totalActive = (progress.clamp(0.0, 1.0) * dotCount);
    final fullActive = totalActive.floor();
    final partial = totalActive - fullActive;

    for (int i = 0; i < dotCount; i++) {
      final start = startOffset + (i * gap) - (dotArc / 2);
      if (i < fullActive) {
        // full active dot
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          start,
          dotArc,
          false,
          paintActive,
        );
      } else if (i == fullActive && partial > 0) {
        final activeArc = dotArc * partial;
        // draw active partial
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          start,
          activeArc,
          false,
          paintActive,
        );
        // draw remaining inactive part of the same dot (optional)
        final remaining = dotArc - activeArc;
        if (remaining > 0.001) {
          canvas.drawArc(
            Rect.fromCircle(center: center, radius: radius),
            start + activeArc,
            remaining,
            false,
            paintInactive,
          );
        }
      } else {
        // inactive dot
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          start,
          dotArc,
          false,
          paintInactive,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DottedProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.dotCount != dotCount ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.inactiveColor != inactiveColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

// class JobsCalendar extends StatefulWidget {
//   const JobsCalendar({super.key});
//
//   @override
//   State<JobsCalendar> createState() => _JobsCalendarState();
// }
//
// class _JobsCalendarState extends State<JobsCalendar> {
//   DateTime _focusedDay = DateTime(2025, 11, 9);
//   DateTime? _selectedDay = DateTime(2025, 11, 9);
//
//   // Example events — matches screenshot (dots shown on specific days)
//   final Map<DateTime, List<String>> events = {
//     DateTime(2025, 11, 9): ['job'],
//     DateTime(2025, 11, 10): ['job'],
//     DateTime(2025, 11, 15): ['job'],
//     DateTime(2025, 11, 16): ['job'],
//     DateTime(2025, 11, 17): ['job'],
//     DateTime(2025, 11, 30): ['job'],
//   };
//
//   List _getEventsForDay(DateTime day) {
//     return events[DateTime(day.year, day.month, day.day)] ?? [];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.black12),
//       ),
//       child: TableCalendar(
//         focusedDay: _focusedDay,
//         firstDay: DateTime(2020),
//         lastDay: DateTime(2030),
//         eventLoader: _getEventsForDay,
//
//         // --- HEADER ---
//         headerStyle: HeaderStyle(
//           formatButtonVisible: false,
//           titleCentered: true,
//           titleTextFormatter: (date, _) =>
//               "${_monthName(date.month)} ${date.year}",
//           titleTextStyle: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//           leftChevronIcon: const Icon(Icons.chevron_left, size: 26),
//           rightChevronIcon: const Icon(Icons.chevron_right, size: 26),
//         ),
//
//         // --- CALENDAR STYLES ---
//         daysOfWeekStyle: const DaysOfWeekStyle(
//           weekdayStyle: TextStyle(color: Colors.grey),
//           weekendStyle: TextStyle(color: Colors.grey),
//         ),
//
//         calendarStyle: CalendarStyle(
//           todayDecoration: const BoxDecoration(),
//           todayTextStyle: const TextStyle(color: Colors.grey),
//           outsideDaysVisible: true,
//           markerSize: 40,
//           selectedDecoration: BoxDecoration(
//             color: AppColors.color293359,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           selectedTextStyle: const TextStyle(color: Colors.white),
//         ),
//
//         // --- SELECT DAY ---
//         selectedDayPredicate: (day) {
//           return isSameDay(_selectedDay, day);
//         },
//
//         onDaySelected: (selected, focused) {
//           setState(() {
//             _selectedDay = selected;
//             _focusedDay = focused;
//           });
//         },
//
//         // --- CUSTOM DAY BUILDER (adds dotted event indicator) ---
//         calendarBuilders: CalendarBuilders(
//           markerBuilder: (context, day, events) {
//             if (events.isEmpty) return null;
//
//             return Positioned(
//               bottom: 6,
//               child: SizedBox(
//                 width: 8,
//                 height: 8,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   backgroundColor: AppColors.colorD9D9D9,
//                   // valueColor: ,
//                   color: AppColors.colorF6C54B,
//
//                   value: 0.3,
//                 ),
//               ),
//               // child: Container(
//               //   width: 8,
//               //   height: 8,
//               //   decoration: BoxDecoration(
//               //     shape: BoxShape.circle,
//               //     border: Border.all(
//               //       color: Colors.blue,
//               //       width: 2,
//               //       strokeAlign: BorderSide.strokeAlignOutside,
//               //     ),
//               //   ),
//               // ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   String _monthName(int m) {
//     const months = [
//       "",
//       "January",
//       "February",
//       "March",
//       "April",
//       "May",
//       "June",
//       "July",
//       "August",
//       "September",
//       "October",
//       "November",
//       "December",
//     ];
//     return months[m];
//   }
// }
