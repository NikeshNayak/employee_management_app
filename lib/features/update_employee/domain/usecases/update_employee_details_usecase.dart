import '../../../../core/resources/data_state.dart';
import '../repository/update_employee_details_repository.dart';

class UpdateEmployeeDetailsUseCase {
  final UpdateEmployeeDetailsRepository _repository;

  UpdateEmployeeDetailsUseCase(this._repository);

  Future<DataState<bool>> updateEmployeeDetails({
    required int id,
    required String employeeName,
    required String role,
    required String fromDate,
    String? toDate,
  }) {
    return _repository.updateEmployeeDetails(
      id: id,
      employeeName: employeeName,
      role: role,
      fromDate: fromDate,
      toDate: toDate,
    );
  }

  Future<DataState<bool>> deleteEmployee({required int id}) {
    return _repository.deleteEmployee(id: id);
  }
}
