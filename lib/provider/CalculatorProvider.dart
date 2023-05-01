import 'dart:math' as math;
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';
import '../constant/AppSymbol.dart';

class CalculatorProvider extends ChangeNotifier {
  String _equation = '0';
  String _result = '0';
  double _equationFontsize = 48.0;
  double _resultFontsize = 38.0;

  String getEquation() {
    return _equation;
  }

  void setEquation(String equation) {
    _equation = equation;
    notifyListeners();
  }

  String getResult() {
    return _result;
  }

  void setResult(String result) {
    _result = result;
    notifyListeners();
  }

  double getEquationFontsize() {
    return _equationFontsize;
  }

  void setEquationFontsize(double equationFontsize) {
    _equationFontsize = equationFontsize;
    notifyListeners();
  }

  double getResultFontsize() {
    return _resultFontsize;
  }

  void setResultFontsize(double resultFontsize) {
    _resultFontsize = resultFontsize;
    notifyListeners();
  }

  void buttonPressed(String text) {
    // change font size
    switch (text) {
      case Symbol.equal:
        _equationFontsize = 38.0;
        _resultFontsize = 48.0;
        break;
      case Symbol.clear:
      case Symbol.clearEntry:
      default:
        _equationFontsize = 48.0;
        _resultFontsize = 38.0;
    }

    // change value
    switch (text) {
      case Symbol.clear:
        _equation = '0';
        _result = '0';
        break;
      case Symbol.clearEntry:
        if (_equation.length == 1) {
          _equation = '0';
          break;
        }
        _equation = _equation.substring(0, _equation.length - 1);
        break;
      case Symbol.equal:
        String validEquation = _equation
            .replaceAll(Symbol.multiplication, '*')
            .replaceAll(Symbol.division, '/')
            .replaceAll(Symbol.pi, math.pi.toString());
        try {
          Parser parser = Parser();
          Expression expression = parser.parse(validEquation);
          ContextModel contextModel = ContextModel();
          _result =
              expression.evaluate(EvaluationType.REAL, contextModel).toString();

          if (_result.endsWith('.0')) {
            _result = _result.substring(0, _result.length - 2);
          }
        } catch (e) {
          _result = 'Failed';
        }

        break;
      default:
        if (_equation == '0') {
          _equation = text;
          break;
        }
        _equation += text;
    }
    notifyListeners();
  }
}
