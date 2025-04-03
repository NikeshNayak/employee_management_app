import 'package:employee_management_app/core/database/tables/employee_details_table_manager.dart';

class AddEmployeeDetailsLocalService {
  final employeeTableManager = EmployeeDetailsTableManager();

  Future<bool> insertEmployee({
    required String employeeName,
    required String role,
    required String fromDate,
    String? toDate,
  }) async {
    return await employeeTableManager.insertEmployee(
      employeeName: employeeName,
      role: role,
      fromDate: fromDate,
      toDate: toDate,
    );
  }
}
