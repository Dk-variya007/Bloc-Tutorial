import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_state_management/bloc/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    on<ResetCounter>(_reset); // Add this line
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }

  void _reset(ResetCounter event, Emitter<CounterState> emit) { // Add this function
    emit(state.copyWith(counter: 0));
  }
}
