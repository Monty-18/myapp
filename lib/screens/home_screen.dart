import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:myapp/widgets/buttons_grid.dart';
import 'package:myapp/widgets/result_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _expression = '';
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        ResultContainer(
          expression: _expression,
          result: _result,
        ),
        ButtonsGrid(
          onButtonTap: handleButtonTap,
        ),
      ],
    );
  }

  void handleButtonTap(String buttonText) {
    switch (buttonText) {
      case 'AC':
        _clear();
        break;
      case 'DEL':
        _deleteLastCharacter();
        break;
      case '=':
        _calculateResult();
        break;
      default:
        _appenedToExpression(buttonText);
    }
  }

  void _clear() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  _deleteLastCharacter() {
    setState(() {
      if (_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    });
  }

  void _calculateResult() {
    try {
      if (_expression.contains('%0')) {
        setState(() {
          _result = '0';
        });
        return;
      }
      if (_expression.contains('/0')) {
        setState(() {
          _result = 'Can\'t divide by 0';
        });
        return;
      }
      _expression = _expression.replaceAll('×', '*');
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        _result = eval.toString();
      });
    } catch (e) {
      setState(() {
        _result = 'Error';
      });
    }
  }

  void _appenedToExpression(String buttonText) {
    setState(() {
      _expression += buttonText;
    });
  }
}
