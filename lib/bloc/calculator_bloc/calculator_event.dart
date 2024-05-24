import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}
class AddEvent extends CalculatorEvent {
  final double number1;
  final double number2;

  const AddEvent(this.number1, this.number2);

  @override
  List<Object> get props => [number1, number2];
}

class SubtractEvent extends CalculatorEvent {
  final double number1;
  final double number2;

  const SubtractEvent(this.number1, this.number2);

  @override
  List<Object> get props => [number1, number2];
}

class MultiplyEvent extends CalculatorEvent {
  final double number1;
  final double number2;

  const MultiplyEvent(this.number1, this.number2);

  @override
  List<Object> get props => [number1, number2];
}

class DivideEvent extends CalculatorEvent {
  final double number1;
  final double number2;

  const DivideEvent(this.number1, this.number2);

  @override
  List<Object> get props => [number1, number2];
}
