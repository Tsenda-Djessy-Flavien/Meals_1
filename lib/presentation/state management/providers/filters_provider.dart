import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/domain/models/meals_model.dart';
import 'package:meals_app/presentation/state%20management/providers/meals_provider.dart';

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

  void setFilter(Map<Filter, bool> chosenFilters) => state = chosenFilters;
}

// ------ other provider  // simple ------ // ceci est un Provider qui depend d'autre Providers

final filteredMealsProvider = Provider<List<MealsModel>>((ref) {
  // on le mettant ici ce la revient à dire que la fun en callback sera executer à chaque fois que l'observateur change
  final meals = ref.watch(mealsProvider); // observateur
  final activeFilters = ref.watch(filtersProvider); // observateur

  return meals.where((meal) {
    if (activeFilters[Filter.gutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegeterian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
