import 'package:flutter_bloc/flutter_bloc.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState(0.0)) {
    on<AddEvent>((event, emit) {
      emit(CalculatorState(event.number1 + event.number2));
    });
    on<SubtractEvent>((event, emit) {
      emit(CalculatorState(event.number1 - event.number2));
    });
    on<MultiplyEvent>((event, emit) {
      emit(CalculatorState(event.number1 * event.number2));
    });
    on<DivideEvent>((event, emit) {
      if (event.number2 != 0) {
        emit(CalculatorState(event.number1 / event.number2));
      } else {
        emit(const CalculatorState(double.nan));
      }
    });
  }
}
