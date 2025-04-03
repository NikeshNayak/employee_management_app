import 'package:bloc/bloc.dart';
import 'package:employee_management_app/features/employee_list/data/models/employee_details_model.dart';
import 'package:employee_management_app/features/employee_list/domain/usecases/employee_list_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/resources/data_state.dart';

part 'get_employee_list_event.dart';
part 'get_employee_list_state.dart';

class GetEmployeeListBloc extends Bloc<GetEmployeeListEvent, GetEmployeeListState> {
  final EmployeeListUseCase _employeeListUseCase;

  GetEmployeeListBloc(this._employeeListUseCase) : super(GetEmployeeListInitialState()) {
    on<GetEmployeeListDataEvent>(_getEmployeeListDataEvent);
    on<GetEmployeeListAddEvent>(_getEmployeeListAddEvent);
    on<GetEmployeeListDeleteEvent>(_getEmployeeListDeleteEvent);
  }

  void _getEmployeeListDataEvent(GetEmployeeListDataEvent event, Emitter<GetEmployeeListState> emit) async {
    emit(GetEmployeeListLoadingState());

    final dataState = await _employeeListUseCase.getEmployeeList();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      final currentEmployees = dataState.data!.where((element) => element.toDate == null).toList();
      currentEmployees.sort((a, b) => b.fromDate.compareTo(a.fromDate));
      final previousEmployees = dataState.data!.where((element) => element.toDate != null).toList();
      previousEmployees.sort((a, b) => b.toDate!.compareTo(a.toDate!));

      emit(GetEmployeeListSuccessState(currentEmployeeList: currentEmployees, previousEmployeeList: previousEmployees));
    }

    if (dataState is DataFailed) {
      emit(GetEmployeeListFailedState(message: 'No Employees Found !'));
    }

    if (dataState is DataException) {
      emit(GetEmployeeListExceptionState(dataState.exception!));
    }
  }

  void _getEmployeeListAddEvent(GetEmployeeListAddEvent event, Emitter<GetEmployeeListState> emit) async {
    emit(GetEmployeeListLoadingState());

    final dataState = await _employeeListUseCase.addEmployee(employee: event.employee);

    if (dataState is DataSuccess && dataState.data == true) {
      emit(GetEmployeeListAddSuccessState(message: 'Employee Added Successfully.'));
    }

    if (dataState is DataFailed) {
      emit(GetEmployeeListFailedState(message: 'Failed to Undo the performed action !!'));
    }

    if (dataState is DataException) {
      emit(GetEmployeeListExceptionState(dataState.exception!));
    }
  }

  void _getEmployeeListDeleteEvent(GetEmployeeListDeleteEvent event, Emitter<GetEmployeeListState> emit) async {
    emit(GetEmployeeListLoadingState());

    final dataState = await _employeeListUseCase.deleteEmployee(id: event.id);

    if (dataState is DataSuccess && dataState.data == true) {
      emit(
        GetEmployeeListDeleteSuccessState(
          deletedEmployee: event.deletedEmployee,
          message: 'Employee Deleted Successfully.',
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(GetEmployeeListFailedState(message: 'Failed to Delete Employee !!'));
    }

    if (dataState is DataException) {
      emit(GetEmployeeListExceptionState(dataState.exception!));
    }
  }
}
