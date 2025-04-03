import 'package:employee_management_app/core/database/tables/employee_details_table_manager.dart';

class EmployeeListLocalService {
  final employeeTableManager = EmployeeDetailsTableManager();

  Future<List<Map<String, dynamic>>> getAllEmployees() async {
    return await employeeTableManager.fetchAllEmployees();
  }

  Future<bool> addEmployee({
    required int id,
    required String employeeName,
    required String role,
    required String fromDate,
    required String? toDate,
  }) async {
    return await employeeTableManager.insertEmployeeById(
      id: id,
      employeeName: employeeName,
      role: role,
      fromDate: fromDate,
      toDate: toDate,
    );
  }

  Future<bool> deleteEmployee(int id) async {
    return await employeeTableManager.deleteEmployee(id);
  }
}
