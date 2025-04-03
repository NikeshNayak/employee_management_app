import 'package:bloc/bloc.dart';
import 'package:employee_management_app/features/add_employee_details/domain/usecases/add_employee_details_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/resources/data_state.dart';

part 'add_employee_details_event.dart';
part 'add_employee_details_state.dart';

class AddEmployeeDetailsBloc extends Bloc<AddEmployeeDetailsEvent, AddEmployeeDetailsState> {
  final AddEmployeeDetailsUseCase _addEmployeeUseCase;

  AddEmployeeDetailsBloc(this._addEmployeeUseCase) : super(AddEmployeeDetailsInitialState()) {
    on<AddEmployeeDetailsDataEvent>(_addEmployeeDetailsDataEvent);
  }

  void _addEmployeeDetailsDataEvent(AddEmployeeDetailsDataEvent event, Emitter<AddEmployeeDetailsState> emit) async {
    try {
      emit(AddEmployeeDetailsLoadingState());

      final dataState = await _addEmployeeUseCase.addEmployeeDetails(
        employeeName: event.employeeName,
        role: event.role,
        fromDate: event.fromDate,
        toDate: event.toDate,
      );

      if (dataState is DataSuccess && dataState.data == true) {
        emit(AddEmployeeDetailsSuccessState('Employee Added Successfully'));
      }

      if (dataState is DataFailed && dataState.data == false) {
        emit(AddEmployeeDetailsFailedState('Failed to Add Employee Details !!'));
      }

      if (dataState is DataException) {
        print(dataState.exception);
        emit(AddEmployeeDetailsExceptionState(dataState.exception!));
      }
    } catch (err) {
      print(err);
      emit(AddEmployeeDetailsExceptionState('Something went wrong !!'));
    }
  }
}
