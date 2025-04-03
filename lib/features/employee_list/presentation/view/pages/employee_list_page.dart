import 'package:employee_management_app/config/routes/routes.dart';
import 'package:employee_management_app/config/theme/app_colors.dart';
import 'package:employee_management_app/core/resources/asset_images.dart';
import 'package:employee_management_app/features/employee_list/data/models/employee_details_model.dart';
import 'package:employee_management_app/features/employee_list/presentation/bloc/get_employee_list/get_employee_list_bloc.dart';
import 'package:employee_management_app/features/employee_list/presentation/view/widgets/employee_item_widget.dart';
import 'package:employee_management_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key});

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  bool _isInit = true;

  List<EmployeeDetailsModel> currentEmployeesList = [];
  List<EmployeeDetailsModel> previousEmployeesList = [];

  void _refreshHandler() {
    BlocProvider.of<GetEmployeeListBloc>(context).add(GetEmployeeListDataEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      BlocProvider.of<GetEmployeeListBloc>(context).add(GetEmployeeListDataEvent());
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetEmployeeListBloc, GetEmployeeListState>(
      listener: _employeeListBlocListener,
      builder: (context, state) {
        final totalItems = currentEmployeesList.length + previousEmployeesList.length + 3;
        return Container(
          color: Theme.of(context).colorScheme.primary,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.lightGreyColor3,
              appBar: AppBar(title: Text('Employee List'), elevation: 1, centerTitle: false),
              body:
                  state is GetEmployeeListLoadingState
                      ? Center(child: CircularProgressIndicator())
                      : (totalItems - 3) > 0
                      ? _buildEmployeeListWidget(totalItems)
                      : _buildNoEmployeeWidget(),
              floatingActionButton: Container(
                height: 50.h,
                width: 50.w,
                margin: EdgeInsets.only(right: 10.w, bottom: 12.h),
                child: FloatingActionButton(
                  onPressed: () async {
                    var response = await Navigator.of(context).pushNamed(Routes.addEmployee);
                    if (response != null) {
                      _refreshHandler();
                    }
                  },
                  elevation: 0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.add, size: 30),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _employeeListBlocListener(context, state) {
    if (state is GetEmployeeListSuccessState) {
      currentEmployeesList = state.currentEmployeeList ?? [];
      previousEmployeesList = state.previousEmployeeList ?? [];
    } else if (state is GetEmployeeListDeleteSuccessState) {
      currentEmployeesList.removeWhere((element) => element.id == state.deletedEmployee?.id);
      previousEmployeesList.removeWhere((element) => element.id == state.deletedEmployee?.id);
      _onDeleteEmployeeShowSnackMsg(state.deletedEmployee!);
    } else if (state is GetEmployeeListAddSuccessState) {
      _refreshHandler();
    } else if (state is GetEmployeeListExceptionState) {
      showSnackMessage(context: context, title: 'Error', text: state.message ?? '', icon: Icons.error);
    }
  }

  Widget _buildEmployeeListWidget(int totalItems) {
    return ListView.separated(
      itemCount: totalItems,
      itemBuilder: (context, index) {
        if (index == 0) {
          return currentEmployeesList.isNotEmpty ? _buildLabel("Current employees") : SizedBox.shrink();
        } else if (index <= currentEmployeesList.length) {
          return _buildEmployeeItem(currentEmployeesList[index - 1]);
        } else if (index == currentEmployeesList.length + 1) {
          return previousEmployeesList.isNotEmpty ? _buildLabel("Previous employees") : SizedBox.shrink();
        } else if (index <= currentEmployeesList.length + previousEmployeesList.length + 1) {
          return _buildEmployeeItem(previousEmployeesList[index - currentEmployeesList.length - 2]);
        } else {
          return _buildFooter();
        }
      },
      separatorBuilder: (context, index) {
        if (index > 0 && index <= currentEmployeesList.length) {
          return SizedBox(height: 1.h);
        } else if (index <= currentEmployeesList.length + previousEmployeesList.length + 1) {
          return SizedBox(height: 1.h);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildNoEmployeeWidget() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 218.84.h,
            width: 261.79.w,
            child: Image.asset(PNGPath.noEmployees, height: 218.84.h, width: 261.79.w),
          ),
          Text(
            'No employee records found',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.blackGreyColor),
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Container(
      color: AppColors.lightGreyColor3,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }

  Widget _buildEmployeeItem(EmployeeDetailsModel employee) {
    return EmployeeItemWidget(
      employee: employee,
      onDelete: () {
        BlocProvider.of<GetEmployeeListBloc>(
          context,
        ).add(GetEmployeeListDeleteEvent(id: employee.id, deletedEmployee: employee));
      },
      onTap: () async {
        var response = await Navigator.of(context).pushNamed(Routes.updateEmployee, arguments: employee);
        if (response != null && response is bool) {
          _refreshHandler();
        } else if (response != null && response is EmployeeDetailsModel) {
          setState(() {
            currentEmployeesList.removeWhere((element) => element.id == response.id);
            previousEmployeesList.removeWhere((element) => element.id == response.id);
          });
          _onDeleteEmployeeShowSnackMsg(response);
        }
      },
    );
  }

  Widget _buildFooter() {
    return Container(
      color: AppColors.lightGreyColor3,
      padding: const EdgeInsets.all(16.0),
      child: Text("Swipe left to delete", style: TextStyle(color: Colors.grey, fontSize: 16)),
    );
  }

  void _onDeleteEmployeeShowSnackMsg(EmployeeDetailsModel deletedEmployee) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.removeCurrentSnackBar();
    final snackBar = SnackBar(
      content: Text('Employee data has been deleted'),
      backgroundColor: AppColors.blackColor1,
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          BlocProvider.of<GetEmployeeListBloc>(context).add(GetEmployeeListAddEvent(employee: deletedEmployee));
        },
      ),
    );
    scaffoldMessenger.showSnackBar(snackBar);
    Future.delayed(Duration(seconds: 3), () {
      scaffoldMessenger.removeCurrentSnackBar();
    });
  }
}
