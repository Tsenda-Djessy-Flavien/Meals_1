import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dataSources/local/dummy_data.dart';
import 'package:meals_app/domain/models/meals_model.dart';

// configuration du provider (fournisseur)
/// we can used 'Provider' ou 'StreamProvider' ou 'StateNotifierProvider'
final mealsProvider = Provider<List<MealsModel>>((ref) {
  // renvoyer la valeur(data) que nous voulons fournir
  return dummyMeals;
});
//// now we can use it dans les widgets qui ont besoin de ces values(data)
