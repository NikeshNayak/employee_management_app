import 'package:employee_management_app/core/database/tables/employee_details_table_manager.dart';

class UpdateEmployeeDetailsLocalService {
  final employeeTableManager = EmployeeDetailsTableManager();

  Future<bool> updateEmployee({
    required int id,
    required String employeeName,
    required String role,
    required String fromDate,
    String? toDate,
  }) async {
    return await employeeTableManager.updateEmployee(
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
