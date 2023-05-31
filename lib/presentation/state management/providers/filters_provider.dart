import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { gutenFree, lactoseFree, vegeterian, vegan }

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.gutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegeterian: false,
          Filter.vegan: false,
        });

  void setFilters(Filter filter, bool isActive) {
    // state[filter] = isActive; // not Allowed! => mutating state

    // copy du Map initial
    state = {
      ...state,
      filter: isActive,
    };
  }
}
