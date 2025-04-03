part of 'update_employee_details_bloc.dart';

abstract class UpdateEmployeeDetailsEvent extends Equatable {
  const UpdateEmployeeDetailsEvent();

  @override
  List<Object?> get props => [];
}

class UpdateEmployeeDetailsDataEvent extends UpdateEmployeeDetailsEvent {
  final int id;
  final String employeeName;
  final String role;
  final String fromDate;
  final String? toDate;

  const UpdateEmployeeDetailsDataEvent({
    required this.id,
    required this.employeeName,
    required this.role,
    required this.fromDate,
    this.toDate,
  });
}

class UpdateEmployeeDetailsDeleteEvent extends UpdateEmployeeDetailsEvent {
  final int id;
  final EmployeeDetailsModel deletedEmployee;

  const UpdateEmployeeDetailsDeleteEvent({required this.id, required this.deletedEmployee});
}
