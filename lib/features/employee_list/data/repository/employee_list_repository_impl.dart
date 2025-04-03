import 'package:employee_management_app/core/resources/data_state.dart';
import 'package:employee_management_app/features/employee_list/data/data_sources/local/employee_list_local_service.dart';
import 'package:employee_management_app/features/employee_list/data/models/employee_details_model.dart';
import 'package:intl/intl.dart';

import '../../domain/repository/employee_list_repository.dart';

class EmployeeListRepositoryImpl extends EmployeeListRepository {
  final EmployeeListLocalService _localService;

  EmployeeListRepositoryImpl(this._localService);

  @override
  Future<DataState<List<EmployeeDetailsModel>>> getEmployeeList() async {
    try {
      List<Map<String, dynamic>> employeesDataList = await _localService.getAllEmployees();
      List<EmployeeDetailsModel> employeesList =
          employeesDataList.map((e) => EmployeeDetailsModel.fromJson(e)).toList();
      if (employeesList.isNotEmpty) {
        return DataSuccess(employeesList);
      }
      return DataFailed([]);
    } catch (err) {
      print(err);
      return DataException('Something went wrong !!-');
    }
  }

  @override
  Future<DataState<bool>> addEmployee({required EmployeeDetailsModel employee}) async {
    try {
      bool isEmployeeAdded = await _localService.addEmployee(
        id: employee.id,
        employeeName: employee.employeeName,
        role: employee.role,
        fromDate: DateFormat('dd-MM-yyyy').format(employee.fromDate),
        toDate: employee.toDate != null ? DateFormat('dd-MM-yyyy').format(employee.toDate!) : null,
      );
      if (isEmployeeAdded) {
        return DataSuccess(true);
      }
      return DataFailed(false);
    } catch (err) {
      print(err);
      return DataException('Something went wrong !!-');
    }
  }

  @override
  Future<DataState<bool>> deleteEmployee({required int id}) async {
    try {
      bool isEmployeeDeleted = await _localService.deleteEmployee(id);
      if (isEmployeeDeleted) {
        return DataSuccess(true);
      }
      return DataFailed(false);
    } catch (err) {
      print(err);
      return DataException('Something went wrong !!-');
    }
  }
}
