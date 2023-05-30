import 'package:flutter/material.dart';
import 'package:meals_app/domain/models/meals_model.dart';
import 'package:meals_app/presentation/widgets/primary_text.dart';
import 'package:meals_app/presentation/widgets/secondary_text.dart';
import 'package:meals_app/utils/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
    required this.onToggleMealFavoriteStatus,
  });

  final MealsModel meal;
  final void Function(MealsModel meal) onToggleMealFavoriteStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => onToggleMealFavoriteStatus(meal),
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(height: 14),
            const PrimaryText(label: MEAL_INGREDIENT),
            const SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              SecondaryText(label: ingredient),
            const SizedBox(height: 24),
            const PrimaryText(label: MEAL_STEP),
            const SizedBox(height: 14),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: SecondaryText(label: step),
              ),
          ],
        ),
      ),
    );
  }
}
