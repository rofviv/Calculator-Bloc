part of 'calculator_bloc.dart';

class CalculatorState extends Equatable {
  final String firstNumber, secondNumber, operatorCalc, result;

  CalculatorState({
    this.firstNumber = "",
    this.secondNumber = "",
    this.operatorCalc = "",
    this.result = "",
  });

  CalculatorState copyWith({
    String? firstNumber,
    String? secondNumber,
    String? operatorCalc,
    String? result,
  }) =>
      CalculatorState(
        firstNumber: firstNumber ?? this.firstNumber,
        secondNumber: secondNumber ?? this.secondNumber,
        operatorCalc: operatorCalc ?? this.operatorCalc,
        result: result ?? this.result,
      );

  @override
  List<Object> get props => [
        firstNumber,
        secondNumber,
        operatorCalc,
        result,
      ];
}
