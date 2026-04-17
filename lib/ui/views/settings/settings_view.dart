import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:weatherapi/core/shared/app_bar_widgets.dart';
import 'package:weatherapi/core/shared/settings_list_switch_widget.dart';
import 'package:weatherapi/core/shared/settings_list_widget.dart';
import 'package:weatherapi/core/shared/settings_text_widget.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark
          ? const Color.fromARGB(255, 3, 24, 41)
          : const Color.fromARGB(255, 102, 186, 255),
      appBar: AppBarWidgets(
        onThemeToggle: () => viewModel.toggleTheme(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SettingsTextWidget(
              text: 'Settings',
              font: 25,
              color: Colors.white,
              fw: FontWeight.w700,
            ),
            const SizedBox(
              height: 12,
            ),
            const SettingsTextWidget(
                text: 'Preference',
                color: Colors.white,
                font: 15,
                fw: FontWeight.normal),
            const SizedBox(
              height: 15,
            ),
            //PREFERENCE
            const SettingsListWidget(
              icon: Icons.thermostat_auto,
              text: 'Temperature Unit',
              trailing: Text('Celsius (C)',
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
            ),
            const SizedBox(
              height: 12,
            ),
            SettingsListSwitchWidget(
              viewModel: viewModel,
              text: 'Weather Alerts',
              iconData: Icons.notifications,
              onChanged: (value) => viewModel.toggleSwitch('weather'),
              value: viewModel.getString('weather'),
            ),
            const SizedBox(
              height: 12,
            ),
            SettingsListSwitchWidget(
              viewModel: viewModel,
              text: 'Location Service',
              iconData: Icons.location_pin,
              value: viewModel.getString('location'),
              onChanged: (value) => viewModel.toggleSwitch('location'),
            ),
            const SizedBox(
              height: 12,
            ),
            const SettingsTextWidget(
                text: 'Appereance',
                color: Colors.white,
                font: 15,
                fw: FontWeight.normal),
            const SizedBox(
              height: 12,
            ),
            SettingsListWidget(
                text: 'Theme',
                icon: Icons.palette,
                trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      final manager = getThemeManager(context);
                      if (value == 'isDark') {
                        manager.setThemeMode(ThemeMode.dark);
                      } else if (value == 'isLight') {
                        manager.setThemeMode(ThemeMode.light);
                      }
                    },
                    itemBuilder: (context) => <PopupMenuEntry<String>>[
                          const PopupMenuItem(
                            value: 'isLight',
                            child: ListTile(
                              leading: Icon(Icons.light_mode),
                              title: Text(
                                'Light',
                              ),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'isDark',
                            child: ListTile(
                              leading: Icon(Icons.dark_mode),
                              title: Text(
                                'Dark',
                              ),
                            ),
                          ),
                        ]))
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
