import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:weatherapi/app/app.locator.dart';
import 'package:weatherapi/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();
  await setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.system,
      lightTheme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        initialRoute: Routes.mainView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [StackedService.routeObserver],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
