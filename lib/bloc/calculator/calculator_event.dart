part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class OnChangeFirstNumberEvent extends CalculatorEvent {
  final String number;
  const OnChangeFirstNumberEvent(this.number);

  @override
  List<Object> get props => [number];
}

class OnChangeSecondNumberEvent extends CalculatorEvent {
  final String number;
  const OnChangeSecondNumberEvent(this.number);

  @override
  List<Object> get props => [number];
}

class OnChangeOperatorEvent extends CalculatorEvent {
  final String operatorCalc;
  const OnChangeOperatorEvent(this.operatorCalc);

  @override
  List<Object> get props => [operatorCalc];
}

class OnResultEvent extends CalculatorEvent {}

class OnDeleteEvent extends CalculatorEvent {}

class OnClearEvent extends CalculatorEvent {}
