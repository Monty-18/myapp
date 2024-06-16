import 'package:flutter/material.dart';
import 'package:myapp/providers/theme_provider.dart';
import 'package:myapp/widgets/text.dart';
import 'package:myapp/widgets/theme_changer_button.dart';
import 'package:provider/provider.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({
    super.key,
    required this.expression,
    required this.result,
  });

  final String expression;
  final String result;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        
        padding: EdgeInsets.fromLTRB(0,screenHeight * 0.02, screenWidth * 0.02, 0),
        width: screenWidth,
        height: screenHeight * 0.35,
        decoration: _resultContainerStyling(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const ThemeChangerButton(),
            SizedBox(
              height: screenHeight * 0.06,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BuildText(
                text: expression,
                textSize: 30,
                isBoldFont: false,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.003,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BuildText(
                text: result,
                textSize: 45,
                isBoldFont: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _resultContainerStyling(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      color: isDarkMode ? Colors.grey.shade900 : const Color(0xFFc5cae9),
    );
  }
}
