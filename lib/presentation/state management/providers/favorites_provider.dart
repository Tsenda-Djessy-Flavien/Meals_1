import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/domain/models/meals_model.dart';

// stocker tous les meals favories dans une List<MealsModel>.
final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<MealsModel>>((ref) {
  return FavoritesMealsNotifier();
});

class FavoritesMealsNotifier extends StateNotifier<List<MealsModel>> {
  // [] -> initialisation de la List, cette value ne doit jamais être modifié
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(MealsModel meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // on extrait tous les elts qui sont stocker dans la liste state
      // ensuite on les ajoute en tant qu'elts individuel à cette nouvelle liste [...state]
      state = [...state, meal];
      return true;
    }

    // state = [];
  }
}
