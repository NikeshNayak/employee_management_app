import '../../../../core/resources/data_state.dart';

abstract class AddEmployeeDetailsRepository {
  Future<DataState<bool>> addEmployeeDetails({
    required String employeeName,
    required String role,
    required String fromDate,
    String? toDate,
  });
}
