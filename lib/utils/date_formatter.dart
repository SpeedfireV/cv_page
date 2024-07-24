import 'package:intl/intl.dart';

String formatDate(String dateStr) {
  final DateTime dateTime = DateTime.parse(dateStr);
  return DateFormat('kk:mm   yyyy-MM-dd').format(dateTime);
}