import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.btnText,
    required this.onButtonTap,
  });

  final String btnText;
  final void Function() onButtonTap;
  @override
  Widget build(BuildContext context) {
    final buttonColor = getButtonColor(btnText, context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        onButtonTap();
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
        ),
        width: screenWidth * 0.01,
        height: screenHeight * 0.05,
        child: Center(
          child: Text(btnText),
        ),
      ),
    );
  }


  Color getButtonColor(String buttonText, BuildContext context) {
    final List<String> operators = [
      '( )', '%', '/', '×', '-', '+', '=',
    ];
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    if(operators.contains(btnText)) {
      return isDarkMode ? Colors.deepPurple : const Color(0xFFc5cae9);
    } else if(btnText == 'AC') {
      return isDarkMode ? Theme.of(context).colorScheme.errorContainer : const Color(0xFFce93d8);
    } else {
      return isDarkMode ? Colors.grey.shade900 : Colors.grey.shade100; 
    }
  }
}
