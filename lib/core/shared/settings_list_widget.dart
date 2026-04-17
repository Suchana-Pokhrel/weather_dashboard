import 'package:flutter/material.dart';

class SettingsListWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;
  const SettingsListWidget({
    super.key,
    required this.text,
    required this.icon,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
          color: isDark
              ? const Color.fromARGB(255, 33, 45, 56)
              : const Color.fromARGB(255, 0, 117, 212),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(text,
            style: const TextStyle(color: Colors.white, fontSize: 13)),
        trailing: trailing,
      ),
    );
  }
}
