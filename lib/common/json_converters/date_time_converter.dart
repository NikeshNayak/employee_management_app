import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) =>
      DateFormat('yyyy-MM-dd HH:mm:ss').parseUTC(json.replaceFirst('T', ' ').replaceFirst('Z', ''));

  @override
  String toJson(DateTime object) => DateFormat("yyyy-MM-dd HH:mm:ss").format(object);
}
