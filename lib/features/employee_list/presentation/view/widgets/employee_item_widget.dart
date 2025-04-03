import 'package:employee_management_app/features/employee_list/data/models/employee_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../core/resources/asset_images.dart';

class EmployeeItemWidget extends StatefulWidget {
  final EmployeeDetailsModel employee;
  final void Function() onDelete;
  final void Function() onTap;

  const EmployeeItemWidget({super.key, required this.employee, required this.onDelete, required this.onTap});

  @override
  State<EmployeeItemWidget> createState() => _EmployeeItemWidgetState();
}

class _EmployeeItemWidgetState extends State<EmployeeItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.employee.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SvgPicture.asset(SVGPath.delete, height: 18.h, width: 17.12.w),
      ),
      onDismissed: (direction) {
        widget.onDelete();
      },
      child: InkWell(
        onTap: () => widget.onTap(),
        child: Container(
          color: Colors.white,
          height: 104.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.employee.employeeName,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.blackColor1),
              ),
              SizedBox(height: 8.h),
              Text(
                widget.employee.role,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.lightGreyColor2),
              ),
              SizedBox(height: 8.h),
              widget.employee.toDate == null
                  ? Text(
                    'From ${DateFormat('d MMM, yyyy').format(widget.employee.fromDate)}',
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.lightGreyColor2),
                  )
                  : Text(
                    '${DateFormat('d MMM, yyyy').format(widget.employee.fromDate)} - ${DateFormat('d MMM, yyyy').format(widget.employee.toDate!)}',
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.lightGreyColor2),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
