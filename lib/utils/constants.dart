// ignore_for_file: constant_identifier_names

import 'package:meals_app/presentation/state%20management/providers/filters_provider.dart';

const APP_NAME = 'Meals APP';

const APP_BAR_TITLE = 'Pick your category';

const NOTHING_FOUND = 'Uh oh... nothing here!';

const CHOOSE_CATEGORY = 'Try selecting a different category!';

const MEAL_INGREDIENT = 'Ingredients';

const MEAL_STEP = 'Steps';

const REMOVE_TO_FAVORITE = 'Meal is no longer a favorite';

const ADD_TO_FAVORITE = 'Marked as a favorite';

const CATEGORY = 'Categories';

const FAVORITE = 'Your Favorites';

const DRAWER_HEAD_TEXT = 'Cooking Up!';

const DRAWER_MAIN_TITLE_MEAL = 'Meals';

const DRAWER_MAIN_TITLE_FILTERS = 'Filters';

const FILTERS_APP_BAR_TITLE = 'Your Filters';

const SWITCH_TITLE_GLUTEN = 'Gluten-free';

const SWITCH_SUBTITLE_GLUTEN = 'Only include gluten-free meals.';

const SWITCH_TITLE_LACTOSE = 'Lactose-Free';

const SWITCH_SUBTITLE_LACTOSE = 'Only include lactose-free meals.';

const SWITCH_TITLE_VEGTARIAN = 'Vegetarian';

const SWITCH_SUBTITLE_VEGTARIAN = 'Only include Vegetarian meals.';

const SWITCH_TITLE_VEGAN = 'Vegen';

const SWITCH_SUBTITLE_VEGAN = 'Only include Vegen meals.';

const kInitialilFilters = {
  Filter.gutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegeterian: false,
  Filter.vegan: false,
};
