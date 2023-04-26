import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:untitled/constant/symbol.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _Calculator createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  String equation = '0';
  String result = '0';
  String expression = '';
  double equationFontsize = 38.0;
  double resultFontsize = 38.0;

  Container makeCalculatorButton({
    required String text,
    required double height,
    required Color color,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * height,
      color: color,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: const BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(16.0)),
        ),
        onPressed: () => buttonPressed(text),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    );
  }

  buttonPressed(String text) {
    setState(() {
      switch (text) {
        case Symbol.clear:
        case Symbol.equal:
          equationFontsize = 38.0;
          resultFontsize = 48.0;
          break;
        case Symbol.clearEntry:
        default:
          equationFontsize = 48.0;
          resultFontsize = 38.0;
      }

      switch (text) {
        case Symbol.clear:
          equation = '0';
          result = '0';
          break;
        case Symbol.clearEntry:
          if (equation.length == 1) {
            equation = '0';
            break;
          }
          equation = equation.substring(0, equation.length - 1);
          // equation = equation.substring(0, equation.length - 1);
          // if (equation == '') {
          //   equation = '0';
          // }
          // equation = equation.length > 1 ? equation.substring(0, equation.length - 1) : '0';
          break;
        case Symbol.equal:
          String validEquation = equation
              .replaceAll(Symbol.multiplication, '*')
              .replaceAll(Symbol.division, '/');
          Parser parser = Parser();
          try {
            Expression expression = parser.parse(validEquation);
            ContextModel contextModel = ContextModel();
            result = expression
                .evaluate(EvaluationType.REAL, contextModel)
                .toString();
          } catch (e) {
            if (e is RangeError) {
              result = e.message;
            }
          }
          break;
        default:
          if (equation == '0') {
            equation = text;
            break;
          }
          equation += text;
      }
      // if (text == Symbol.CLEAR) {
      //   equation = '0';
      //   result = '0';
      // } else if (text == Symbol.CLEAR_ENTRY) {
      //   equation = equation.substring(0, equation.length - 1);
      //   if (equation == '') {
      //     equation = '0';
      //   }
      // } else if (text == Symbol.EQUAL) {
      // } else {
      //   if (equation == '0') {
      //     equation = text;
      //   } else {
      //     equation += text;
      //   }
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator'), centerTitle: true),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontsize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontsize),
            ),
          ),
          const Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        makeCalculatorButton(
                          text: Symbol.clear,
                          color: Colors.redAccent,
                          height: 1,
                        ),
                        makeCalculatorButton(
                          text: Symbol.clearEntry,
                          color: Colors.blueAccent,
                          height: 1,
                        ),
                        makeCalculatorButton(
                          text: Symbol.division,
                          color: Colors.blueAccent,
                          height: 1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        makeCalculatorButton(
                          text: '7',
                          color: Colors.grey,
                          height: 1,
                        ),
                        makeCalculatorButton(
                          text: '8',
                          color: Colors.grey,
                          height: 1,
                        ),
                        makeCalculatorButton(
                          text: '9',
                          color: Colors.grey,
                          height: 1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        makeCalculatorButton(
                          text: '4',
                          color: Colors.grey,
                          height: 1,
                        ),
                        makeCalculatorButton(
                          text: '5',
                          color: Colors.grey,
                          height: 1,
                        ),
                        makeCalculatorButton(
                          text: '6',
                          color: Colors.grey,
                          height: 1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        makeCalculatorButton(
                          text: '1',
                          color: Colors.grey,
                          height: 1,
                        ),
                        makeCalculatorButton(
                          text: '2',
                          color: Colors.grey,
                          height: 1,
                        ),
                        makeCalculatorButton(
                          text: '3',
                          color: Colors.grey,
                          height: 1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        makeCalculatorButton(
                          text: '.',
                          color: Colors.grey,
                          height: 1,
                        ),
                        makeCalculatorButton(
                          text: '0',
                          color: Colors.grey,
                          height: 1,
                        ),
                        makeCalculatorButton(
                          text: '00',
                          color: Colors.grey,
                          height: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      makeCalculatorButton(
                        text: Symbol.multiplication,
                        height: 1,
                        color: Colors.blueAccent,
                      )
                    ]),
                    TableRow(children: [
                      makeCalculatorButton(
                        text: Symbol.addition,
                        height: 1,
                        color: Colors.blueAccent,
                      )
                    ]),
                    TableRow(children: [
                      makeCalculatorButton(
                        text: Symbol.subtraction,
                        height: 1,
                        color: Colors.blueAccent,
                      )
                    ]),
                    TableRow(children: [
                      makeCalculatorButton(
                        text: Symbol.equal,
                        height: 2,
                        color: Colors.redAccent,
                      )
                    ]),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
