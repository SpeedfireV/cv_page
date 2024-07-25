import 'package:intl/intl.dart';

String formatDateWithMinutes(String dateStr) {
  final DateTime dateTime = DateTime.parse(dateStr);
  return DateFormat('kk:mm   yyyy-MM-dd').format(dateTime);
}
String formatDate(String dateStr) {
  final DateTime dateTime = DateTime.parse(dateStr);
  return DateFormat('yyyy.MM.dd').format(dateTime);
}
String durationDate(DateTime initDate, DateTime? endDate){
  return "${formatDate(initDate.toString())} - ${endDate != null ?formatDate(endDate.toString()) : ''}";
}