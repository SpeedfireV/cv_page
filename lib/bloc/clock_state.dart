// time_state.dart
import 'package:intl/intl.dart';

class ClockState {
  final DateTime currentTime;
  final String formattedTime;

  ClockState({required this.currentTime})
      : formattedTime = DateFormat('HH:mm:ss').format(currentTime);
}
