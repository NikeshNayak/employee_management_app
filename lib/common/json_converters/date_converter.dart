import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DateConverter implements JsonConverter<DateTime, String> {
  const DateConverter();

  @override
  DateTime fromJson(String json) => DateFormat('dd-MM-yyyy').parse(json);

  @override
  String toJson(DateTime object) => DateFormat("dd-MM-yyyy").format(object);
}
