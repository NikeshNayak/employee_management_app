import '../../../../core/resources/data_state.dart';

abstract class UpdateEmployeeDetailsRepository {
  Future<DataState<bool>> updateEmployeeDetails({
    required int id,
    required String employeeName,
    required String role,
    required String fromDate,
    String? toDate,
  });

  Future<DataState<bool>> deleteEmployee({required int id});
}
