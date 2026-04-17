// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;
import 'package:weatherapi/ui/views/forecast/forecast_view.dart' as _i5;
import 'package:weatherapi/ui/views/home/home_view.dart' as _i3;
import 'package:weatherapi/ui/views/main/main_view.dart' as _i2;
import 'package:weatherapi/ui/views/settings/settings_view.dart' as _i6;
import 'package:weatherapi/ui/views/startup/startup_view.dart' as _i4;

class Routes {
  static const mainView = '/';

  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const forecastView = '/forecast-view';

  static const settingsView = '/settings-view';

  static const all = <String>{
    mainView,
    homeView,
    startupView,
    forecastView,
    settingsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.mainView,
      page: _i2.MainView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i3.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i4.StartupView,
    ),
    _i1.RouteDef(
      Routes.forecastView,
      page: _i5.ForecastView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i6.SettingsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.MainView: (data) {
      final args = data.getArgs<MainViewArguments>(
        orElse: () => const MainViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.MainView(key: args.key),
        settings: data,
      );
    },
    _i3.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.HomeView(key: args.key),
        settings: data,
      );
    },
    _i4.StartupView: (data) {
      final args = data.getArgs<StartupViewArguments>(
        orElse: () => const StartupViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.StartupView(key: args.key),
        settings: data,
      );
    },
    _i5.ForecastView: (data) {
      final args = data.getArgs<ForecastViewArguments>(
        orElse: () => const ForecastViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.ForecastView(key: args.key),
        settings: data,
      );
    },
    _i6.SettingsView: (data) {
      final args = data.getArgs<SettingsViewArguments>(
        orElse: () => const SettingsViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.SettingsView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MainViewArguments {
  const MainViewArguments({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant MainViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class StartupViewArguments {
  const StartupViewArguments({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant StartupViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ForecastViewArguments {
  const ForecastViewArguments({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ForecastViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SettingsViewArguments {
  const SettingsViewArguments({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SettingsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToMainView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mainView,
        arguments: MainViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.startupView,
        arguments: StartupViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForecastView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.forecastView,
        arguments: ForecastViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.settingsView,
        arguments: SettingsViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.mainView,
        arguments: MainViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.startupView,
        arguments: StartupViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForecastView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.forecastView,
        arguments: ForecastViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.settingsView,
        arguments: SettingsViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
