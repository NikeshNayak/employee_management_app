import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/theme/app_colors.dart';
import '../core/resources/asset_images.dart';

Future<DateTime?> showCustomDatePickerDialog({
  required BuildContext context,
  required bool isFromDate,
  required DateTime startDate,
  DateTime? selectedDate,
}) async {
  final config = CalendarDatePicker2WithActionButtonsConfig(
    todayTextStyle: TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.w400,
      fontSize: 15.sp,
    ),
    selectedDayHighlightColor: Theme.of(context).colorScheme.primary,
    weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
    calendarViewMode: CalendarDatePicker2Mode.day,
    calendarType: CalendarDatePicker2Type.single,
    currentDate: DateTime.now(),

    weekdayLabelTextStyle: TextStyle(color: AppColors.blackColor1, fontWeight: FontWeight.w400, fontSize: 15.sp),
    firstDayOfWeek: 0,
    controlsHeight: 50,
    dayMaxWidth: 40,
    animateToDisplayedMonthDate: false,
    controlsTextStyle: TextStyle(color: AppColors.blackColor1, fontSize: 18.sp, fontWeight: FontWeight.w500),
    dayTextStyle: TextStyle(color: AppColors.blackColor1, fontWeight: FontWeight.w400, fontSize: 15.sp),
    disabledDayTextStyle: const TextStyle(color: Colors.grey),
    centerAlignModePicker: true,
    useAbbrLabelForMonthModePicker: false,
    disableMonthPicker: true,
    disableModePicker: true,
    firstDate: startDate,
    lastDate: DateTime(2100),
    isStartRange: isFromDate,
    gapBetweenCalendarAndButtons: 15.w,
    buttonPadding: EdgeInsets.zero,
    dynamicCalendarRows: true,
    lightBlueColor: AppColors.lightBlueColor,
    lastMonthHeight: 14.h,
    lastMonthWidth: 14.w,
    // lastMonthIcon: SizedBox(
    //   height: 24.h,
    //   width: 24.w,
    //   child: SvgPicture.asset(SVGPath.arrowDropdownLeft, height: 8.h, width: 14.w),
    // ),
    nextMonthHeight: 14.h,
    nextMonthWidth: 14.w,
    // nextMonthIcon: SizedBox(
    //   height: 24.h,
    //   width: 24.w,
    //   child: SvgPicture.asset(SVGPath.arrowDropdownRight, height: 8.h, width: 14.w),
    // ),
    selectedDateCustomWidget: SizedBox(
      height: 23.h,
      width: 20.w,
      child: SvgPicture.asset(SVGPath.date, height: 23.h, width: 20.w),
    ),
    customSelectedDateTextStyle: TextStyle(color: AppColors.blackColor1, fontWeight: FontWeight.w400, fontSize: 16.sp),
    cancelButton: Container(
      height: 40.h,
      width: 73.w,
      decoration: BoxDecoration(color: AppColors.lightBlueColor, borderRadius: BorderRadius.circular(6)),
      alignment: Alignment.center,
      child: Text(
        'Cancel',
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.primary),
      ),
    ),
    okButton: Container(
      height: 40.h,
      width: 73.w,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(6)),
      alignment: Alignment.center,
      child: Text('Save', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white)),
    ),
  );
  final width = MediaQuery.of(context).size.width;
  final values = await showCalendarDatePicker2Dialog(
    context: context,
    config: config,
    value: selectedDate != null ? [selectedDate] : [],
    dialogSize: Size(width * 0.90, 492),
    borderRadius: BorderRadius.circular(15),
    dialogBackgroundColor: Colors.white,
  );
  return values != null && values.isNotEmpty ? values.first : null;
}
