
import 'package:flutter/material.dart';

class CalculatorButtonsTextProvider extends ChangeNotifier {
  final List<String> _buttonTexts = [
    'AC', '( )', '%', '/',
    '7', '8', '9', '×',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '.', 'DEL', '=',
  ];

  List<String> get btnTexts => _buttonTexts;
}