part of 'add_employee_details_bloc.dart';

abstract class AddEmployeeDetailsEvent extends Equatable {
  const AddEmployeeDetailsEvent();

  @override
  List<Object?> get props => [];
}

class AddEmployeeDetailsDataEvent extends AddEmployeeDetailsEvent {
  final String employeeName;
  final String role;
  final String fromDate;
  final String? toDate;

  const AddEmployeeDetailsDataEvent({
    required this.employeeName,
    required this.role,
    required this.fromDate,
    this.toDate,
  });
}
