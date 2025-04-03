import 'package:employee_management_app/core/resources/data_state.dart';
import 'package:employee_management_app/features/add_employee_details/data/data_sources/local/add_employee_detail_local_service.dart';
import 'package:employee_management_app/features/add_employee_details/domain/repository/add_employee_details_repository.dart';

class AddEmployeeDetailsRepositoryImpl extends AddEmployeeDetailsRepository {
  final AddEmployeeDetailsLocalService _localService;

  AddEmployeeDetailsRepositoryImpl(this._localService);

  @override
  Future<DataState<bool>> addEmployeeDetails({
    required String employeeName,
    required String role,
    required String fromDate,
    String? toDate,
  }) async {
    try {
      bool isEmployeeAdded = await _localService.insertEmployee(
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
}
