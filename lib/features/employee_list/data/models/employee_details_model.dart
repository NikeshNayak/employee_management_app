// ignore_for_file: invalid_annotation_target

import 'package:employee_management_app/common/json_converters/date_converter.dart';
import 'package:employee_management_app/common/json_converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_details_model.freezed.dart';
part 'employee_details_model.g.dart';

@freezed
abstract class EmployeeDetailsModel with _$EmployeeDetailsModel {
  @JsonSerializable(explicitToJson: true)
  factory EmployeeDetailsModel({
    required int id,
    required String employeeName,
    required String role,
    @DateConverter() required DateTime fromDate,
    @DateConverter() DateTime? toDate,
    @DateTimeConverter() required DateTime createdAt,
    @DateTimeConverter() required DateTime updatedAt,
  }) = _EmployeeDetailsModel;

  factory EmployeeDetailsModel.fromJson(Map<String, dynamic> json) => _$EmployeeDetailsModelFromJson(json);
}
