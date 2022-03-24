import 'package:calculadora/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CalculatorBloc calc = CalculatorBloc();
  group("Arimetica básica >", () {
    // tearDown(() {
    //   calc.add(OnClearEvent());
    // });

    calc.add(OnChangeFirstNumberEvent("1"));
    calc.add(OnChangeOperatorEvent("+"));
    calc.add(OnChangeSecondNumberEvent("2"));
    calc.add(OnResultEvent());
    test("Suma", () {
      expect(calc.state.result.toString(), "3.0");
    });

    

    calc.add(OnChangeFirstNumberEvent("100"));
    calc.add(OnChangeOperatorEvent("-"));
    calc.add(OnChangeSecondNumberEvent("50"));
    calc.add(OnResultEvent());
    test("Resta", () {
      expect(calc.state.result.toString(), "50.0");
    });
  });
}
