import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class BuildText extends StatelessWidget {
  const BuildText({
    super.key,
    required this.text,
    required this.textSize,
    required this.isBoldFont,
  });

  final String text;
  final double textSize;
  final bool isBoldFont;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: getTextColor(text, isDarkMode),
        fontSize: textSize,
        fontWeight: isBoldFont ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Color getTextColor(String text, bool isDarkMode) {
    if(text == 'Error' || text == 'Can\'t divide by 0') {
      return Colors.red;
    } else {
      return isDarkMode ? Colors.white : Colors.black;
    }
  }
}
