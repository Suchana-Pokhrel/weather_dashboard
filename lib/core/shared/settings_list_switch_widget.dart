import 'package:flutter/material.dart';
import 'package:weatherapi/core/shared/settings_list_widget.dart';
import 'package:weatherapi/ui/views/settings/settings_viewmodel.dart';

class SettingsListSwitchWidget extends StatelessWidget {
  const SettingsListSwitchWidget({
    super.key,
    required this.viewModel,
    required this.text,
    required this.iconData,
    required this.value,
    required this.onChanged,
  });

  final SettingsViewModel viewModel;
  final String text;
  final IconData iconData;
  final bool value;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return SettingsListWidget(
      text: text, //'Weather Alerts',
      icon: iconData, //Icons.notifications,
      trailing: Switch(
          activeThumbColor: const Color.fromARGB(255, 212, 228, 255),
          value: value, //viewModel.getString('weather'),
          onChanged: onChanged //viewModel.toggleSwitch('weather'),
          ),
    );
  }
}
