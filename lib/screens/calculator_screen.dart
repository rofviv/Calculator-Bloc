import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calculadora/widgets/calc_button.dart';
import 'package:calculadora/widgets/line_separator.dart';
import 'package:calculadora/widgets/main_result.dart';
import 'package:calculadora/widgets/sub_result.dart';

import '../bloc/bloc.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);

    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SubResult(text: state.firstNumber),
                    SubResult(text: state.operatorCalc),
                    SubResult(text: state.secondNumber),
                    LineSeparator(),
                    MainResultText(text: state.result),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: 'AC',
                  bgColor: Color(0xffA5A5A5),
                  onPressed: () => calculatorBloc.add(OnClearEvent()),
                ),
                CalculatorButton(
                  text: '+/-',
                  bgColor: Color(0xffA5A5A5),
                  onPressed: () => print('+/-'),
                ),
                CalculatorButton(
                  text: 'del',
                  bgColor: Color(0xffA5A5A5),
                  onPressed: () => calculatorBloc.add(OnDeleteEvent()),
                ),
                CalculatorButton(
                  text: '/',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorBloc.add(OnChangeOperatorEvent('/')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '7',
                  onPressed: () => calculatorBloc.changeNumber('7'),
                ),
                CalculatorButton(
                  text: '8',
                  onPressed: () => calculatorBloc.changeNumber('8'),
                ),
                CalculatorButton(
                  text: '9',
                  onPressed: () => calculatorBloc.changeNumber('9'),
                ),
                CalculatorButton(
                  text: 'X',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorBloc.add(OnChangeOperatorEvent("x")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '4',
                  onPressed: () => calculatorBloc.changeNumber('4'),
                ),
                CalculatorButton(
                  text: '5',
                  onPressed: () => calculatorBloc.changeNumber('5'),
                ),
                CalculatorButton(
                  text: '6',
                  onPressed: () => calculatorBloc.changeNumber('6'),
                ),
                CalculatorButton(
                  text: '-',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorBloc.add(OnChangeOperatorEvent("-")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '1',
                  onPressed: () => calculatorBloc.changeNumber('1'),
                ),
                CalculatorButton(
                  text: '2',
                  onPressed: () => calculatorBloc.changeNumber('2'),
                ),
                CalculatorButton(
                  text: '3',
                  onPressed: () => calculatorBloc.changeNumber('3'),
                ),
                CalculatorButton(
                  text: '+',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorBloc.add(OnChangeOperatorEvent("+")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '0',
                  big: true,
                  onPressed: () => calculatorBloc.changeNumber('0'),
                ),
                CalculatorButton(
                  text: '.',
                  onPressed: () => calculatorBloc.changeNumber("."),
                ),
                CalculatorButton(
                  text: '=',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorBloc.add(OnResultEvent()),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
