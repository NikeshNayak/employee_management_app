part of 'add_employee_details_bloc.dart';

abstract class AddEmployeeDetailsState extends Equatable {
  final String? message;

  const AddEmployeeDetailsState({this.message});

  @override
  List<Object> get props => [];
}

class AddEmployeeDetailsInitialState extends AddEmployeeDetailsState {}

class AddEmployeeDetailsLoadingState extends AddEmployeeDetailsState {}

class AddEmployeeDetailsSuccessState extends AddEmployeeDetailsState {
  const AddEmployeeDetailsSuccessState(String message) : super(message: message);
}

class AddEmployeeDetailsFailedState extends AddEmployeeDetailsState {
  const AddEmployeeDetailsFailedState(String message) : super(message: message);
}

class AddEmployeeDetailsExceptionState extends AddEmployeeDetailsState {
  const AddEmployeeDetailsExceptionState(String message) : super(message: message);
}
