import 'package:flutter/material.dart';
import 'package:untitled/calculator.dart';
import 'package:untitled/constant/AppColor.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _toCalculatorAfter(const Duration(seconds: 2));
  }

  _toCalculatorAfter(Duration duration) async {
    await Future.delayed(duration, () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const Calculator();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.defaultButtonBackground,
      body: Center(
        child: Icon(
          Icons.calculate,
          color: AppColor.defaultButtonForeground,
          size: 100,
        ),
      ),
    );
  }
}
