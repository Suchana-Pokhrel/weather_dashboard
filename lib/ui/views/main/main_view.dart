import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

class MainView extends StackedView<MainViewModel> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: IndexedStack(
        index: viewModel.currentIndex,
        children: viewModel.views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        backgroundColor:
            isDark ? const Color.fromARGB(255, 33, 45, 56) : Colors.blue,
        selectedItemColor: isDark ? Colors.blueAccent : Colors.white,
        unselectedItemColor:
            isDark ? Colors.grey : const Color.fromARGB(255, 222, 219, 219),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month),
            label: 'Forecast',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  @override
  MainViewModel viewModelBuilder(BuildContext context) => MainViewModel();
}
