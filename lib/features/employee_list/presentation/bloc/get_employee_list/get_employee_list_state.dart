part of 'get_employee_list_bloc.dart';

abstract class GetEmployeeListState extends Equatable {
  final List<EmployeeDetailsModel>? currentEmployeeList;
  final List<EmployeeDetailsModel>? previousEmployeeList;
  final EmployeeDetailsModel? deletedEmployee;
  final String? message;

  const GetEmployeeListState({this.currentEmployeeList, this.previousEmployeeList, this.deletedEmployee, this.message});

  @override
  List<Object> get props => [];
}

class GetEmployeeListInitialState extends GetEmployeeListState {}

class GetEmployeeListLoadingState extends GetEmployeeListState {}

class GetEmployeeListSuccessState extends GetEmployeeListState {
  const GetEmployeeListSuccessState({super.currentEmployeeList, super.previousEmployeeList});
}

class GetEmployeeListAddSuccessState extends GetEmployeeListState {
  const GetEmployeeListAddSuccessState({super.message});
}

class GetEmployeeListDeleteSuccessState extends GetEmployeeListState {
  const GetEmployeeListDeleteSuccessState({super.deletedEmployee, super.message});
}

class GetEmployeeListFailedState extends GetEmployeeListState {
  const GetEmployeeListFailedState({super.message});
}

class GetEmployeeListExceptionState extends GetEmployeeListState {
  const GetEmployeeListExceptionState(String message) : super(message: message);
}
