part of 'get_employee_list_bloc.dart';

abstract class GetEmployeeListEvent extends Equatable {
  const GetEmployeeListEvent();

  @override
  List<Object?> get props => [];
}

class GetEmployeeListDataEvent extends GetEmployeeListEvent {}

class GetEmployeeListAddEvent extends GetEmployeeListEvent {
  final EmployeeDetailsModel employee;

  const GetEmployeeListAddEvent({required this.employee});
}

class GetEmployeeListDeleteEvent extends GetEmployeeListEvent {
  final int id;
  final EmployeeDetailsModel deletedEmployee;

  const GetEmployeeListDeleteEvent({required this.id, required this.deletedEmployee});
}
