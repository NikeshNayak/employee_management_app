import 'package:employee_management_app/common/custom_text_form_field_widget.dart';
import 'package:employee_management_app/config/theme/app_colors.dart';
import 'package:employee_management_app/core/resources/asset_images.dart';
import 'package:employee_management_app/features/employee_list/data/models/employee_details_model.dart';
import 'package:employee_management_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../../common/common_functionality.dart';
import '../../bloc/update_employee_details/update_employee_details_bloc.dart';

class UpdateEmployeeDetailsPage extends StatefulWidget {
  const UpdateEmployeeDetailsPage({super.key});

  @override
  State<UpdateEmployeeDetailsPage> createState() => _UpdateEmployeeDetailsPageState();
}

class _UpdateEmployeeDetailsPageState extends State<UpdateEmployeeDetailsPage> {
  bool _isInit = true;

  final _formKey = GlobalKey<FormState>();
  bool _isValidate = false;

  final roles = ['Product Designer', 'Flutter Developer', 'QA Tester', 'Product Owner'];

  final _employeeNameController = TextEditingController();
  final _roleNameController = TextEditingController();
  String? _selectedRole;
  final _fromDateController = TextEditingController();
  DateTime? _selectedFromDate;
  final _toDateController = TextEditingController();
  DateTime? _selectedToDate;
  EmployeeDetailsModel? _employeeModel;

  void _saveEmployeeDetails() {
    setState(() {
      _isValidate = true;
    });
    if (!_isFormValid()) {
      return;
    }
    BlocProvider.of<UpdateEmployeeDetailsBloc>(context).add(
      UpdateEmployeeDetailsDataEvent(
        id: _employeeModel!.id,
        employeeName: _employeeNameController.text,
        role: _roleNameController.text.trim(),
        fromDate: DateFormat('dd-MM-yyyy').format(_selectedFromDate!),
        toDate: _selectedToDate != null ? DateFormat('dd-MM-yyyy').format(_selectedToDate!) : null,
      ),
    );
  }

  bool _isFormValid() {
    return _employeeNameController.text.trim().isNotEmpty && _selectedRole != null && _selectedFromDate != null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final args = ModalRoute.of(context)?.settings.arguments as EmployeeDetailsModel?;
      _employeeModel = args;
      _employeeNameController.text = _employeeModel?.employeeName ?? '';
      _roleNameController.text = _employeeModel?.role ?? '';
      _selectedRole = _employeeModel?.role ?? '';
      _selectedFromDate = _employeeModel?.fromDate;
      _fromDateController.text = DateFormat('d MMM yyyy').format(_employeeModel!.fromDate);
      if (_employeeModel!.toDate != null) {
        _selectedToDate = _employeeModel?.toDate;
        _toDateController.text = DateFormat('d MMM yyyy').format(_employeeModel!.toDate!);
      }
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateEmployeeDetailsBloc, UpdateEmployeeDetailsState>(
      listener: (context, state) {
        if (state is UpdateEmployeeDetailsSuccessState) {
          showSnackMessage(
            context: context,
            title: 'Success',
            text: state.message ?? '',
            icon: Icons.done,
            color: Colors.green,
          );
          Navigator.of(context).pop(true);
        } else if (state is UpdateEmployeeDetailsDeleteSuccessState) {
          Navigator.of(context).pop(state.deletedEmployee);
        } else if (state is UpdateEmployeeDetailsFailedState) {
          showSnackMessage(context: context, title: 'Error', text: state.message ?? '', icon: Icons.error);
        } else if (state is UpdateEmployeeDetailsExceptionState) {
          showSnackMessage(context: context, title: 'Error', text: state.message ?? '', icon: Icons.error);
        }
      },
      builder: (context, state) {
        return Container(
          color: Theme.of(context).colorScheme.primary,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                leading: SizedBox.shrink(),
                leadingWidth: 0,
                title: Text('Edit Employee Details'),
                elevation: 1,
                centerTitle: false,
                actions: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<UpdateEmployeeDetailsBloc>(
                        context,
                      ).add(UpdateEmployeeDetailsDeleteEvent(id: _employeeModel!.id, deletedEmployee: _employeeModel!));
                    },
                    child: SvgPicture.asset(SVGPath.delete, height: 16.88.h, width: 15.w),
                  ),
                  SizedBox(width: 18.w),
                ],
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        _employeeNameInputWidget(),
                        SizedBox(height: 20.h),
                        _roleDropDownInputWidget(),
                        SizedBox(height: 20.h),
                        _dateSelectionInputWidget(context),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(thickness: 2.h, height: 2.h, color: AppColors.lightGreyColor3),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.lightBlueColor,
                          fixedSize: Size(73.w, 40.h),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      ElevatedButton(
                        onPressed: _saveEmployeeDetails,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize: Size(73.w, 40.h),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 15.w),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _employeeNameInputWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormFieldWidget(
          controller: _employeeNameController,
          hintText: 'Employee Name',
          prefixIcon: SvgPicture.asset(SVGPath.employeeName),
          prefixIconConstraints: BoxConstraints(maxHeight: 19.12.h, minWidth: 44.w),
          borderColor:
              _isValidate && _employeeNameController.text.trim().isEmpty ? Colors.red : AppColors.lightGreyColor,
        ),
        if (_isValidate && _employeeNameController.text.trim().isEmpty)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text('Required Field !!', style: TextStyle(color: Colors.red, fontSize: 12)),
              ],
            ),
          ),
      ],
    );
  }

  Widget _roleDropDownInputWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormFieldWidget(
          onTap: () {
            _showRolesListBottomSheet();
          },
          controller: _roleNameController,
          prefixIcon: SvgPicture.asset(SVGPath.employeeRole),
          prefixIconConstraints: BoxConstraints(maxHeight: 19.12.h, minWidth: 44.w),
          borderColor: _isValidate && _selectedRole == null ? Colors.red : AppColors.lightGreyColor,
          hintText: 'Select role',
          suffixIcon: SvgPicture.asset(SVGPath.dropdown),
          suffixIconConstraints: BoxConstraints(maxHeight: 19.12.h, minWidth: 44.w),
          readOnly: true,
          showCursor: false,
        ),
        if (_isValidate && _selectedRole == null)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text('Required Field !!', style: TextStyle(color: Colors.red, fontSize: 12)),
              ],
            ),
          ),
      ],
    );
  }

  void _showRolesListBottomSheet() async {
    var response = await showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return SizedBox(
          height: (52.h * roles.length) + (roles.length - 1).h,
          child: ListView.separated(
            itemBuilder: (context, index) {
              final role = roles[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).pop(role);
                },
                child: Container(
                  height: 52.h,
                  alignment: Alignment.center,
                  child: Text(
                    role,
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            separatorBuilder:
                (context, index) => Divider(color: AppColors.lightGreyColor3, height: 1.h, thickness: 1.h),
            itemCount: roles.length,
          ),
        );
      },
    );
    if (response != null) {
      setState(() {
        _selectedRole = response;
        _roleNameController.text = response;
      });
    }
  }

  Widget _dateSelectionInputWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomTextFormFieldWidget(
                onTap: () async {
                  final dateTime = await showCustomDatePickerDialog(
                    context: context,
                    isFromDate: true,
                    startDate: DateTime(2000),
                    selectedDate: _selectedFromDate,
                  );
                  if (dateTime != null) {
                    print('Selected From Date: ${dateTime.toString()}');
                    setState(() {
                      _selectedFromDate = dateTime;
                      _fromDateController.text = DateFormat('d MMM yyyy').format(dateTime);
                      _selectedToDate = null;
                      _toDateController.text = '';
                    });
                  }
                },
                controller: _fromDateController,
                prefixIcon: SvgPicture.asset(SVGPath.date),
                prefixIconConstraints: BoxConstraints(maxHeight: 19.12.h, minWidth: 40.w),
                borderColor:
                    _isValidate && _fromDateController.text.trim().isEmpty ? Colors.red : AppColors.lightGreyColor,
                hintText: 'No Date',
                readOnly: true,
                showCursor: false,
              ),
            ),
            SizedBox(width: 20.w),
            SvgPicture.asset(SVGPath.arrow, height: 9.54.h, width: 13.21.w),
            SizedBox(width: 20.w),
            Expanded(
              child: CustomTextFormFieldWidget(
                onTap: () async {
                  final dateTime = await showCustomDatePickerDialog(
                    context: context,
                    isFromDate: false,
                    startDate: _selectedFromDate ?? DateTime(2000),
                    selectedDate: _selectedToDate,
                  );
                  if (dateTime != null) {
                    print('Selected To Date: ${dateTime.toString()}');
                    setState(() {
                      _selectedToDate = dateTime;
                      _toDateController.text = DateFormat('d MMM yyyy').format(dateTime);
                    });
                    return;
                  }
                  setState(() {
                    _selectedToDate = null;
                    _toDateController.text = '';
                  });
                },
                controller: _toDateController,
                prefixIcon: SvgPicture.asset(SVGPath.date),
                prefixIconConstraints: BoxConstraints(maxHeight: 19.12.h, minWidth: 40.w),
                hintText: 'No date',
                readOnly: true,
                showCursor: false,
              ),
            ),
          ],
        ),
        if (_isValidate && _fromDateController.text.trim().isEmpty)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text('Required Field !!', style: TextStyle(color: Colors.red, fontSize: 12)),
              ],
            ),
          ),
      ],
    );
  }
}
