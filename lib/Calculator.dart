import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/constant/AppColor.dart';
import 'constant/AppSymbol.dart';
import 'CalculatorButton.dart';
import 'provider/CalculatorProvider.dart';

class Calculator extends StatelessWidget {
  const Calculator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: Scaffold(
        backgroundColor: AppColor.backGround,
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Consumer<CalculatorProvider>(
                builder: (_, calculatorProvider, __) => Text(
                  calculatorProvider.getEquation(),
                  style: TextStyle(
                    fontSize: calculatorProvider.getEquationFontsize(),
                    color: AppColor.equation,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Consumer<CalculatorProvider>(
                builder: (_, calculatorProvider, __) => Text(
                  calculatorProvider.getResult(),
                  style: TextStyle(
                    fontSize: calculatorProvider.getResultFontsize(),
                    color: AppColor.result,
                  ),
                ),
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
                          CalculatorButton(
                            text: Symbol.clear,
                            backgroundColor:
                                const Color.fromARGB(255, 252, 100, 100),
                          ),
                          CalculatorButton(
                            text: Symbol.clearEntry,
                            foregroundColor:
                                const Color.fromARGB(255, 252, 100, 100),
                          ),
                          CalculatorButton(
                            text: '^',
                            foregroundColor:
                                const Color.fromARGB(255, 252, 100, 100),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CalculatorButton(
                            text: Symbol.pi,
                            foregroundColor:
                                const Color.fromARGB(255, 252, 100, 100),
                          ),
                          CalculatorButton(
                            text: '(',
                            foregroundColor:
                                const Color.fromARGB(255, 252, 100, 100),
                          ),
                          CalculatorButton(
                            text: ')',
                            foregroundColor:
                                const Color.fromARGB(255, 252, 100, 100),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CalculatorButton(
                            text: '7',
                          ),
                          CalculatorButton(
                            text: '8',
                          ),
                          CalculatorButton(
                            text: '9',
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CalculatorButton(
                            text: '4',
                          ),
                          CalculatorButton(
                            text: '5',
                          ),
                          CalculatorButton(
                            text: '6',
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CalculatorButton(
                            text: '1',
                          ),
                          CalculatorButton(
                            text: '2',
                          ),
                          CalculatorButton(
                            text: '3',
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CalculatorButton(
                            text: '.',
                          ),
                          CalculatorButton(
                            text: '0',
                          ),
                          CalculatorButton(
                            text: '00',
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
                        CalculatorButton(
                          text: Symbol.division,
                          foregroundColor:
                              const Color.fromARGB(255, 252, 100, 100),
                        )
                      ]),
                      TableRow(children: [
                        CalculatorButton(
                          text: Symbol.multiplication,
                          foregroundColor:
                              const Color.fromARGB(255, 252, 100, 100),
                        )
                      ]),
                      TableRow(children: [
                        CalculatorButton(
                          text: Symbol.addition,
                          foregroundColor:
                              const Color.fromARGB(255, 252, 100, 100),
                        )
                      ]),
                      TableRow(children: [
                        CalculatorButton(
                          text: Symbol.subtraction,
                          foregroundColor:
                              const Color.fromARGB(255, 252, 100, 100),
                        )
                      ]),
                      TableRow(children: [
                        CalculatorButton(
                          text: Symbol.equal,
                          height: 2,
                          backgroundColor:
                              const Color.fromARGB(255, 104, 204, 159),
                        )
                      ]),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
