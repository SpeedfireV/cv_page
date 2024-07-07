import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'clock_event.dart';
part 'clock_state.dart';

class ClockBloc extends Bloc<ClockEvent, ClockState> {
  ClockBloc() : super(ClockInitial()) {
    on<ClockEvent>((event, emit) {
      emit(state);
    });
  }
}
