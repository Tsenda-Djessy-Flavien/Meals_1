import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/presentation/state%20management/providers/filters_provider.dart';
import 'package:meals_app/presentation/widgets/switch_button.dart';
import 'package:meals_app/utils/constants.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(FILTERS_APP_BAR_TITLE),
      ),
      body: Column(
        children: [
          SwitchButton(
            value: activeFilters[Filter.gutenFree]!,
            onChanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilters(Filter.gutenFree, isChecked);
            },
            title: SWITCH_TITLE_GLUTEN,
            subtitle: SWITCH_SUBTITLE_GLUTEN,
          ),
          SwitchButton(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilters(Filter.lactoseFree, isChecked);
            },
            title: SWITCH_TITLE_LACTOSE,
            subtitle: SWITCH_SUBTITLE_LACTOSE,
          ),
          SwitchButton(
            value: activeFilters[Filter.vegeterian]!,
            onChanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilters(Filter.vegeterian, isChecked);
            },
            title: SWITCH_TITLE_VEGTARIAN,
            subtitle: SWITCH_SUBTITLE_VEGTARIAN,
          ),
          SwitchButton(
            value: activeFilters[Filter.vegan]!,
            onChanged: (bool isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilters(Filter.vegan, isChecked);
            },
            title: SWITCH_TITLE_VEGAN,
            subtitle: SWITCH_SUBTITLE_VEGAN,
          ),
        ],
      ),
    );
  }
}
