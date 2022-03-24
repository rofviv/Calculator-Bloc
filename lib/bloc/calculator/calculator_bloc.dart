import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<OnChangeFirstNumberEvent>(_onChangeFirstNumberEvent);
    on<OnChangeSecondNumberEvent>(_onChangeSecondNumberEvent);
    on<OnChangeOperatorEvent>(_onChangeOperatorEvent);
    on<OnResultEvent>(_onResultEvent);
    on<OnDeleteEvent>(_onDeleteEvent);
    on<OnClearEvent>(_onClear);
  }

  void _onChangeFirstNumberEvent(
      OnChangeFirstNumberEvent event, Emitter<CalculatorState> emit) {
    if (state.firstNumber.isEmpty && event.number == ".") {
      emit(state.copyWith(firstNumber: "0."));
      return;
    }
    if (state.firstNumber.isNotEmpty) {
      if (event.number == "." && state.firstNumber.contains(".")) return;
      if (state.firstNumber.substring(0, 1) == "0" && !state.firstNumber.contains(".")) {
        emit(state.copyWith(firstNumber: "${state.firstNumber}.${event.number}"));
        return;
      }
    }
    emit(state.copyWith(firstNumber: "${state.firstNumber}${event.number}"));
  }

  void _onChangeSecondNumberEvent(
      OnChangeSecondNumberEvent event, Emitter<CalculatorState> emit) {
    if (state.secondNumber.isEmpty && event.number == ".") {
      emit(state.copyWith(secondNumber: "0."));
      return;
    }
    if (state.secondNumber.isNotEmpty) {
      if (event.number == "." && state.secondNumber.contains(".")) return;
      if (state.secondNumber.substring(0, 1) == "0" && !state.secondNumber.contains(".")) {
        emit(state.copyWith(secondNumber: "${state.secondNumber}.${event.number}"));
        return;
      }
    }
    emit(state.copyWith(secondNumber: "${state.secondNumber}${event.number}"));
  }

  void _onResultEvent(OnResultEvent event, Emitter<CalculatorState> emit) {
    if (state.firstNumber.isNotEmpty &&
        state.secondNumber.isNotEmpty &&
        state.operatorCalc.isNotEmpty) {
      double result = _resultOperation();

      emit(state.copyWith(result: result.toString()));
    }
  }

  void _onChangeOperatorEvent(
      OnChangeOperatorEvent event, Emitter<CalculatorState> emit) {
    if (state.firstNumber.isEmpty) return;
    if (state.secondNumber.isNotEmpty) {
      add(OnClearEvent());
      double total = _resultOperation();
      add(OnChangeFirstNumberEvent(total.toString()));
      add(OnChangeOperatorEvent(event.operatorCalc));
      return;
    }
    emit(state.copyWith(operatorCalc: event.operatorCalc));
  }

  void _onDeleteEvent(OnDeleteEvent event, Emitter<CalculatorState> emit) {
    if (state.result.isNotEmpty) {
      emit(state.copyWith(result: ""));
      return;
    }
    if (state.secondNumber.isNotEmpty) {
      String number =
          state.secondNumber.substring(0, state.secondNumber.length - 1);
      emit(state.copyWith(secondNumber: number));
      return;
    }

    if (state.operatorCalc.isNotEmpty) {
      emit(state.copyWith(operatorCalc: ""));
      return;
    }
    if (state.firstNumber.isNotEmpty) {
      String number =
          state.firstNumber.substring(0, state.firstNumber.length - 1);
      emit(state.copyWith(firstNumber: number));
    }
  }

  void _onClear(OnClearEvent event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(
      firstNumber: "",
      secondNumber: "",
      operatorCalc: "",
      result: "",
    ));
  }

  double _resultOperation() {
    double result = 0;
    switch (state.operatorCalc) {
      case "+":
        result =
            double.parse(state.firstNumber) + double.parse(state.secondNumber);
        break;
      case "-":
        result =
            double.parse(state.firstNumber) - double.parse(state.secondNumber);
        break;
      case "x":
        result =
            double.parse(state.firstNumber) * double.parse(state.secondNumber);
        break;
      case "/":
        result =
            double.parse(state.firstNumber) / double.parse(state.secondNumber);
        break;
    }
    return result;
  }

  void changeNumber(String number) {
    if (state.result.isNotEmpty) {
      add(OnClearEvent());
      add(OnChangeFirstNumberEvent(number));
      return;
    }
    (state.operatorCalc.isEmpty)
        ? add(OnChangeFirstNumberEvent(number))
        : add(OnChangeSecondNumberEvent(number));
  }
}
