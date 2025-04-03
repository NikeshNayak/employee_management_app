import 'package:employee_management_app/features/employee_list/data/models/employee_details_model.dart';

import '../../../../core/resources/data_state.dart';

abstract class EmployeeListRepository {
  Future<DataState<List<EmployeeDetailsModel>>> getEmployeeList();

  Future<DataState<bool>> addEmployee({required EmployeeDetailsModel employee});

  Future<DataState<bool>> deleteEmployee({required int id});
}
