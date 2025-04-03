import 'package:employee_management_app/features/employee_list/data/models/employee_details_model.dart';

import '../../../../core/resources/data_state.dart';
import '../repository/employee_list_repository.dart';

class EmployeeListUseCase {
  final EmployeeListRepository _repository;

  EmployeeListUseCase(this._repository);

  Future<DataState<List<EmployeeDetailsModel>>> getEmployeeList() {
    return _repository.getEmployeeList();
  }

  Future<DataState<bool>> addEmployee({required EmployeeDetailsModel employee}) {
    return _repository.addEmployee(employee: employee);
  }

  Future<DataState<bool>> deleteEmployee({required int id}) {
    return _repository.deleteEmployee(id: id);
  }
}
