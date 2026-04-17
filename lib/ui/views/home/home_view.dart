import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:weatherapi/ui/common/ui_helpers.dart';
import 'package:weatherapi/ui/views/home/home_view.form.dart';
import 'package:weatherapi/core/shared/app_bar_widgets.dart';
import 'package:weatherapi/ui/views/home/widgets/busy_widget.dart';
import 'package:weatherapi/ui/views/home/widgets/current_location_name_widget.dart';
import 'package:weatherapi/ui/views/home/widgets/current_temperature_widget.dart';
import 'package:weatherapi/core/shared/error_display_widget.dart';
import 'package:weatherapi/ui/views/home/widgets/hourly_align_widget.dart';
import 'package:weatherapi/ui/views/home/widgets/hourly_list_widget.dart';
import 'package:weatherapi/ui/views/home/widgets/search_bar_widget.dart';
import 'package:weatherapi/ui/views/home/widgets/temperature_view.dart';
import 'package:weatherapi/ui/views/home/widgets/weather_card_widget.dart';

import 'viewmodels/home_viewmodel.dart';

@FormView(fields: [FormTextField(name: 'search')])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
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
          onRefresh: viewModel.onRefresh,
          child: BusyWidget(
            isBusy: viewModel.isBusy,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 24),
                child: Column(
                  children: [
                    SearchBarWidget(
                      viewModel: viewModel,
                    ),
                    verticalSpaceMedium,
                    if (viewModel.hasError)
                      ErrorDisplayWidget(
                        errorMessage: viewModel.modelError.toString(),
                      ),
                    CurrentLocationNameWidget(
                      viewModel: viewModel,
                    ),
                    CurrentTemperatureWidget(
                      viewModel: viewModel,
                    ),
                    verticalSpaceSmall,
                    WeatherCardWidget(
                      viewModel: viewModel,
                    ),
                    verticalSpaceSmall,
                    const HourlyAlignWidget(),
                    verticalSpaceSmall,
                    HourlyListWidget(
                      viewModel: viewModel,
                    ),
                    verticalSpaceSmall,
                    TemperatureView(
                      viewModel: viewModel,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    syncFormWithViewModel(viewModel);

    viewModel.initialize();
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
