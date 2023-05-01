import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/constant/AppColor.dart';
import 'provider/CalculatorProvider.dart';

class CalculatorButton extends StatelessWidget {
  String text;
  Color backgroundColor;
  double height;
  Color foregroundColor;

  CalculatorButton({
    required this.text,
    this.backgroundColor = AppColor.defaultButtonBackground,
    this.foregroundColor = AppColor.defaultButtonForeground,
    this.height = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CalculatorProvider calculatorProvider = Provider.of<CalculatorProvider>(
      context,
      listen: false,
    );
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipOval(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1 * height,
          color: backgroundColor,
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: const BorderSide(
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              padding: const MaterialStatePropertyAll(EdgeInsets.all(16.0)),
            ),
            onPressed: () => calculatorProvider.buttonPressed(text),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: foregroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
