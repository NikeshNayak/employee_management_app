part of 'update_employee_details_bloc.dart';

abstract class UpdateEmployeeDetailsState extends Equatable {
  final EmployeeDetailsModel? deletedEmployee;
  final String? message;

  const UpdateEmployeeDetailsState({this.deletedEmployee, this.message});

  @override
  List<Object> get props => [];
}

class UpdateEmployeeDetailsInitialState extends UpdateEmployeeDetailsState {}

class UpdateEmployeeDetailsLoadingState extends UpdateEmployeeDetailsState {}

class UpdateEmployeeDetailsSuccessState extends UpdateEmployeeDetailsState {
  const UpdateEmployeeDetailsSuccessState(String message) : super(message: message);
}

class UpdateEmployeeDetailsDeleteSuccessState extends UpdateEmployeeDetailsState {
  const UpdateEmployeeDetailsDeleteSuccessState({super.deletedEmployee, super.message});
}

class UpdateEmployeeDetailsFailedState extends UpdateEmployeeDetailsState {
  const UpdateEmployeeDetailsFailedState(String message) : super(message: message);
}

class UpdateEmployeeDetailsExceptionState extends UpdateEmployeeDetailsState {
  const UpdateEmployeeDetailsExceptionState(String message) : super(message: message);
}
