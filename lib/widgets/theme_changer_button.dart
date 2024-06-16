import 'package:flutter/material.dart';
import 'package:myapp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangerButton extends StatelessWidget {
  const ThemeChangerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      onPressed: () {
        themeProvider.toggleTheme();
      },
      icon: Icon(
        themeProvider.themeMode == ThemeMode.dark ?  Icons.dark_mode : Icons.light_mode
      ),
    );
  }
}
