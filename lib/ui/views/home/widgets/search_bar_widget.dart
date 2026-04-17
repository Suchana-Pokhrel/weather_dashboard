import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weatherapi/ui/views/home/viewmodels/home_viewmodel.dart';

class SearchBarWidget extends ViewModelWidget<HomeViewModel> {
  const SearchBarWidget({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(
    BuildContext context,
    HomeViewModel viewModel,
  ) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: isDark
                  ? const Color.fromARGB(255, 33, 45, 56)
                  : const Color.fromARGB(255, 0, 117, 212),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            controller: viewModel.searchController,
            textInputAction: TextInputAction.search,
            enableSuggestions: true,
            onSubmitted: (value) {
              final query = value.trim();
              if (query.isNotEmpty) {
                viewModel.onLocationSelected(query);
              }
            },
            decoration: InputDecoration(
                hintText: 'Search Location...',
                hintStyle: TextStyle(
                    color: isDark
                        ? Colors.grey
                        : const Color.fromARGB(255, 255, 246, 246)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isDark
                            ? Colors.grey
                            : const Color.fromARGB(255, 32, 169, 255),
                        width: 0),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isDark
                            ? const Color.fromARGB(255, 222, 219, 219)
                            : const Color.fromARGB(255, 44, 125, 255),
                        width: isDark ? 0 : 1),
                    borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: viewModel.searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          viewModel.searchController.clear();
                          viewModel.onRefresh();
                        },
                        icon:
                            const Icon(Icons.close_rounded, color: Colors.grey))
                    : null),
          ),
        ),
      ],
    );
  }
}
