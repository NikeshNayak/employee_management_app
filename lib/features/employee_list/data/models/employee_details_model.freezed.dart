// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeDetailsModel {

  int get id;

  String get employeeName;

  String get role;

  @DateConverter() DateTime get fromDate;

  @DateConverter() DateTime? get toDate;

  @DateTimeConverter() DateTime get createdAt;

  @DateTimeConverter() DateTime get updatedAt;

  /// Create a copy of EmployeeDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmployeeDetailsModelCopyWith<EmployeeDetailsModel> get copyWith =>
      _$EmployeeDetailsModelCopyWithImpl<EmployeeDetailsModel>(this as EmployeeDetailsModel, _$identity);

  /// Serializes this EmployeeDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is EmployeeDetailsModel &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.employeeName, employeeName) || other.employeeName == employeeName) &&
        (identical(other.role, role) || other.role == role) &&
        (identical(other.fromDate, fromDate) || other.fromDate == fromDate) &&
        (identical(other.toDate, toDate) || other.toDate == toDate) &&
        (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
        (identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(
          runtimeType,
          id,
          employeeName,
          role,
          fromDate,
          toDate,
          createdAt,
          updatedAt);

  @override
  String toString() {
    return 'EmployeeDetailsModel(id: $id, employeeName: $employeeName, role: $role, fromDate: $fromDate, toDate: $toDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }


}

/// @nodoc
abstract mixin class $EmployeeDetailsModelCopyWith<$Res> {
  factory $EmployeeDetailsModelCopyWith(EmployeeDetailsModel value,
      $Res Function(EmployeeDetailsModel) _then) = _$EmployeeDetailsModelCopyWithImpl;

  @useResult
  $Res call({
    int id, String employeeName, String role, @DateConverter() DateTime fromDate, @DateConverter() DateTime? toDate, @DateTimeConverter() DateTime createdAt, @DateTimeConverter() DateTime updatedAt
  });


}

/// @nodoc
class _$EmployeeDetailsModelCopyWithImpl<$Res>
    implements $EmployeeDetailsModelCopyWith<$Res> {
  _$EmployeeDetailsModelCopyWithImpl(this._self, this._then);

  final EmployeeDetailsModel _self;
  final $Res Function(EmployeeDetailsModel) _then;

  /// Create a copy of EmployeeDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? id = null, Object? employeeName = null, Object? role = null, Object? fromDate = null, Object? toDate = freezed, Object? createdAt = null, Object? updatedAt = null,}) {
    return _then(_self.copyWith(
      id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
      as int,
      employeeName: null == employeeName ? _self.employeeName : employeeName // ignore: cast_nullable_to_non_nullable
      as String,
      role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
      as String,
      fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
      as DateTime,
      toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
      as DateTime?,
      createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
      as DateTime,
      updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
      as DateTime,
    ));
  }

}


/// @nodoc

@JsonSerializable(explicitToJson: true)
class _EmployeeDetailsModel implements EmployeeDetailsModel {
  _EmployeeDetailsModel(
      {required this.id, required this.employeeName, required this.role, @DateConverter() required this.fromDate, @DateConverter() this.toDate, @DateTimeConverter() required this.createdAt, @DateTimeConverter() required this.updatedAt});

  factory _EmployeeDetailsModel.fromJson(Map<String, dynamic> json) => _$EmployeeDetailsModelFromJson(json);

  @override final int id;
  @override final String employeeName;
  @override final String role;
  @override
  @DateConverter()
  final DateTime fromDate;
  @override
  @DateConverter()
  final DateTime? toDate;
  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  @DateTimeConverter()
  final DateTime updatedAt;

  /// Create a copy of EmployeeDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmployeeDetailsModelCopyWith<_EmployeeDetailsModel> get copyWith =>
      __$EmployeeDetailsModelCopyWithImpl<_EmployeeDetailsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EmployeeDetailsModelToJson(this,);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _EmployeeDetailsModel &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.employeeName, employeeName) || other.employeeName == employeeName) &&
        (identical(other.role, role) || other.role == role) &&
        (identical(other.fromDate, fromDate) || other.fromDate == fromDate) &&
        (identical(other.toDate, toDate) || other.toDate == toDate) &&
        (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
        (identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(
          runtimeType,
          id,
          employeeName,
          role,
          fromDate,
          toDate,
          createdAt,
          updatedAt);

  @override
  String toString() {
    return 'EmployeeDetailsModel(id: $id, employeeName: $employeeName, role: $role, fromDate: $fromDate, toDate: $toDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }


}

/// @nodoc
abstract mixin class _$EmployeeDetailsModelCopyWith<$Res> implements $EmployeeDetailsModelCopyWith<$Res> {
  factory _$EmployeeDetailsModelCopyWith(_EmployeeDetailsModel value,
      $Res Function(_EmployeeDetailsModel) _then) = __$EmployeeDetailsModelCopyWithImpl;

  @override
  @useResult
  $Res call({
    int id, String employeeName, String role, @DateConverter() DateTime fromDate, @DateConverter() DateTime? toDate, @DateTimeConverter() DateTime createdAt, @DateTimeConverter() DateTime updatedAt
  });


}

/// @nodoc
class __$EmployeeDetailsModelCopyWithImpl<$Res>
    implements _$EmployeeDetailsModelCopyWith<$Res> {
  __$EmployeeDetailsModelCopyWithImpl(this._self, this._then);

  final _EmployeeDetailsModel _self;
  final $Res Function(_EmployeeDetailsModel) _then;

  /// Create a copy of EmployeeDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? id = null, Object? employeeName = null, Object? role = null, Object? fromDate = null, Object? toDate = freezed, Object? createdAt = null, Object? updatedAt = null,}) {
    return _then(_EmployeeDetailsModel(
      id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
      as int,
      employeeName: null == employeeName ? _self.employeeName : employeeName // ignore: cast_nullable_to_non_nullable
      as String,
      role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
      as String,
      fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
      as DateTime,
      toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
      as DateTime?,
      createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
      as DateTime,
      updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
      as DateTime,
    ));
  }


}

// dart format on
