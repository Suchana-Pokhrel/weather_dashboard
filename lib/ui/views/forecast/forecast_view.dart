import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weatherapi/core/shared/app_bar_widgets.dart';
import 'package:weatherapi/ui/views/forecast/widgets/forecat_view_widget.dart';
import 'package:weatherapi/core/shared/error_display_widget.dart';
import 'package:weatherapi/ui/views/home/widgets/busy_widget.dart';

import 'viewmodels/forecast_viewmodel.dart';

class ForecastView extends StackedView<ForecastViewModel> {
  const ForecastView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForecastViewModel viewModel,
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
        body: RefreshIndicator(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _buildHeader(
                    '7-Day Forecast',
                    const Color.fromRGBO(255, 255, 255, 1),
                    25,
                    FontWeight.w600),
                _buildHeader(
                    viewModel.forecast.isNotEmpty
                        ? viewModel.forecast[0].cityName
                        : "Unknown City",
                    Colors.white,
                    15,
                    FontWeight.normal),
                const SizedBox(
                  height: 12,
                ),
                _buildBody(viewModel, isDark),
              ],
            ),
          ),
          onRefresh: () => viewModel.onForecastRefresh(),
        ));
  }

  Text _buildHeader(String text, Color color, double font, FontWeight fw) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: font, fontWeight: fw),
    );
  }

  Widget _buildBody(ForecastViewModel viewModel, bool isDark) {
    if (viewModel.isBusy) {
      BusyWidget(
          isBusy: viewModel.isBusy,
          child: const Center(
            child: CircularProgressIndicator(),
          ));
    }

    if (viewModel.forecast.isEmpty) {
      const Center(
          child: ErrorDisplayWidget(
        errorMessage: 'NO data found',
      ));
    }
    if (viewModel.hasError) {
      Center(
          child: ErrorDisplayWidget(
        errorMessage: viewModel.modelError.toString(),
      ));
    }

    return ForecatViewWidget(
      isDark: isDark,
      viewModel: viewModel,
    );
  }

  @override
  void onViewModelReady(ForecastViewModel viewModel) {
    viewModel.loadForecast();
  }

  @override
  ForecastViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForecastViewModel();
}
