import 'package:equatable/equatable.dart';

class CalculatorState extends Equatable {
  final double result;

  const CalculatorState(this.result);

  @override
  List<Object> get props => [result];
}
