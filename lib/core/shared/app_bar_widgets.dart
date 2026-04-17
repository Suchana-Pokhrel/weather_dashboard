import 'package:flutter/material.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onThemeToggle;
  const AppBarWidgets({super.key, required this.onThemeToggle});
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      backgroundColor:
          isDarkMode ? const Color.fromARGB(86, 2, 35, 62) : Colors.blue,
      elevation: 10,
      title: const Text(
        'Weather App',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
      ),
      actions: [
        Row(
          children: [
            IconButton.filled(
              onPressed: onThemeToggle,
              icon: Icon(isDarkMode ? Icons.nightlight_round : Icons.wb_sunny),
              style: IconButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 57, 89, 116),
                foregroundColor: Colors.white,
              ),
              iconSize: 20,
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
