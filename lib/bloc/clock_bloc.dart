// time_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:cv_page_new/bloc/clock_event.dart';
import 'package:cv_page_new/bloc/clock_state.dart';

class ClockBloc extends Bloc<ClockEvent, ClockState> {
  ClockBloc() : super(ClockState(currentTime: DateTime.now())) {
    on<UpdateClock>((event, emit) {
      emit(ClockState(currentTime: DateTime.now()));
    });

    // Periodically add UpdateTime event to update the time every second
    Stream.periodic(Duration(seconds: 1)).listen((_) {
      add(UpdateClock());
    });
  }
}
