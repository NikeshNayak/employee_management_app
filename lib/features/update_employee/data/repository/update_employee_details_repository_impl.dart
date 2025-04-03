import 'package:employee_management_app/core/resources/data_state.dart';

import '../../domain/repository/update_employee_details_repository.dart';
import '../data_sources/local/update_employee_detail_local_service.dart';

class UpdateEmployeeDetailsRepositoryImpl extends UpdateEmployeeDetailsRepository {
  final UpdateEmployeeDetailsLocalService _localService;

  UpdateEmployeeDetailsRepositoryImpl(this._localService);

  @override
  Future<DataState<bool>> updateEmployeeDetails({
    required int id,
    required String employeeName,
    required String role,
    required String fromDate,
    String? toDate,
  }) async {
    try {
      bool isEmployeeAdded = await _localService.updateEmployee(
        id: id,
        employeeName: employeeName,
        role: role,
        fromDate: fromDate,
        toDate: toDate,
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
