import 'package:employee_management_app/features/add_employee_details/domain/repository/add_employee_details_repository.dart';

import '../../../../core/resources/data_state.dart';

class AddEmployeeDetailsUseCase {
  final AddEmployeeDetailsRepository _repository;

  AddEmployeeDetailsUseCase(this._repository);

  Future<DataState<bool>> addEmployeeDetails({
    required String employeeName,
    required String role,
    required String fromDate,
    String? toDate,
  }) {
    return _repository.addEmployeeDetails(employeeName: employeeName, role: role, fromDate: fromDate, toDate: toDate);
  }
}
