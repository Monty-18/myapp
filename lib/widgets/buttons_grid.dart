import 'package:flutter/material.dart';
import 'package:myapp/providers/calculator_button_text_provider.dart';
import 'package:myapp/widgets/calculator_button.dart';
import 'package:provider/provider.dart';

class ButtonsGrid extends StatelessWidget {
  const ButtonsGrid({super.key, required this.onButtonTap,});

  final void Function(String buttonText) onButtonTap;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorButtonsTextProvider>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.2, // Adjust button aspect ratio
        ),
        itemCount: provider.btnTexts.length,
        itemBuilder: (context, index) {
          final currentButtonText = provider.btnTexts[index];
          return CalculatorButton(
            btnText: currentButtonText,
            onButtonTap: () {
              onButtonTap(currentButtonText);
            },
          );
        },
      ),
    );
  }
}
