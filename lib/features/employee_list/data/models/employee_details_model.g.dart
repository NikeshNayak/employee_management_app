// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeDetailsModel _$EmployeeDetailsModelFromJson(Map<String, dynamic> json) => _EmployeeDetailsModel(
  id: (json['id'] as num).toInt(),
  employeeName: json['employeeName'] as String,
  role: json['role'] as String,
  fromDate: const DateConverter().fromJson(json['fromDate'] as String),
  toDate: _$JsonConverterFromJson<String, DateTime>(json['toDate'], const DateConverter().fromJson),
  createdAt: const DateTimeConverter().fromJson(json['createdAt'] as String),
  updatedAt: const DateTimeConverter().fromJson(json['updatedAt'] as String),
);

Map<String, dynamic> _$EmployeeDetailsModelToJson(_EmployeeDetailsModel instance) => <String, dynamic>{
  'id': instance.id,
  'employeeName': instance.employeeName,
  'role': instance.role,
  'fromDate': const DateConverter().toJson(instance.fromDate),
  'toDate': _$JsonConverterToJson<String, DateTime>(instance.toDate, const DateConverter().toJson),
  'createdAt': const DateTimeConverter().toJson(instance.createdAt),
  'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
};

Value? _$JsonConverterFromJson<Json, Value>(Object? json, Value? Function(Json json) fromJson) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(Value? value, Json? Function(Value value) toJson) =>
    value == null ? null : toJson(value);
