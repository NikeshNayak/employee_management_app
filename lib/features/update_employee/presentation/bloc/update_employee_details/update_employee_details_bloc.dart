import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../employee_list/data/models/employee_details_model.dart';
import '../../../domain/usecases/update_employee_details_usecase.dart';

part 'update_employee_details_event.dart';
part 'update_employee_details_state.dart';

class UpdateEmployeeDetailsBloc extends Bloc<UpdateEmployeeDetailsEvent, UpdateEmployeeDetailsState> {
  final UpdateEmployeeDetailsUseCase _updateEmployeeUseCase;

  UpdateEmployeeDetailsBloc(this._updateEmployeeUseCase) : super(UpdateEmployeeDetailsInitialState()) {
    on<UpdateEmployeeDetailsDataEvent>(_updateEmployeeDetailsDataEvent);
    on<UpdateEmployeeDetailsDeleteEvent>(_updateEmployeeDetailsDeleteEvent);
  }

  void _updateEmployeeDetailsDataEvent(
    UpdateEmployeeDetailsDataEvent event,
    Emitter<UpdateEmployeeDetailsState> emit,
  ) async {
    try {
      emit(UpdateEmployeeDetailsLoadingState());

      final dataState = await _updateEmployeeUseCase.updateEmployeeDetails(
        id: event.id,
        employeeName: event.employeeName,
        role: event.role,
        fromDate: event.fromDate,
        toDate: event.toDate,
      );

      if (dataState is DataSuccess && dataState.data == true) {
        emit(UpdateEmployeeDetailsSuccessState('Employee Updated Successfully'));
      }

      if (dataState is DataFailed && dataState.data == false) {
        emit(UpdateEmployeeDetailsFailedState('Failed to Update Employee Details !!'));
      }

      if (dataState is DataException) {
        print(dataState.exception);
        emit(UpdateEmployeeDetailsExceptionState(dataState.exception!));
      }
    } catch (err) {
      print(err);
      emit(UpdateEmployeeDetailsExceptionState('Something went wrong !!'));
    }
  }

  void _updateEmployeeDetailsDeleteEvent(
    UpdateEmployeeDetailsDeleteEvent event,
    Emitter<UpdateEmployeeDetailsState> emit,
  ) async {
    emit(UpdateEmployeeDetailsLoadingState());

    final dataState = await _updateEmployeeUseCase.deleteEmployee(id: event.id);

    if (dataState is DataSuccess && dataState.data == true) {
      emit(
        UpdateEmployeeDetailsDeleteSuccessState(
          deletedEmployee: event.deletedEmployee,
          message: 'Employee Deleted Successfully.',
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(UpdateEmployeeDetailsFailedState('Failed to Delete Employee !!'));
    }

    if (dataState is DataException) {
      emit(UpdateEmployeeDetailsExceptionState(dataState.exception!));
    }
  }
}
