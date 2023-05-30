import 'package:flutter/material.dart';
import 'package:meals_app/data/dataSources/local/dummy_data.dart';
import 'package:meals_app/domain/models/meals_model.dart';
import 'package:meals_app/presentation/pages/categories_screen.dart';
import 'package:meals_app/presentation/pages/filters_screen.dart';
import 'package:meals_app/presentation/pages/meals_screen.dart';
import 'package:meals_app/presentation/widgets/main_drawer.dart';
import 'package:meals_app/utils/constants.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;
  final List<MealsModel> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialilFilters;

  void _selectPage(newIndex) {
    setState(() {
      _selectPageIndex = newIndex;
    });
  }

  void _showInOfMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavoriteStatus(MealsModel meal) {
    // verifie si cela existe deja dans la liste ou pas
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      // isExisting = true
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInOfMessage(REMOVE_TO_FAVORITE);
      // print('remove ${meal.title}');
    } else {
      // isExisting = false
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInOfMessage(ADD_TO_FAVORITE);
      // print('add ${meal.title}');
    }
  }

  // quand on press sur le DrawerList,
  // on obtient une valeur differente à l'interieur de cette func
  void _setScreen(String idScreen) async {
    Navigator.of(context).pop(); // || 1 -> do that
    if (idScreen == 'filters') {
      // Navigator.of(context).pop(); || 1 idem
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        // va prendre la data dans FilterScreen qui seront ici (tabScreen)
        MaterialPageRoute(
          builder: (context) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );
      // ?? vérifie si la valeur qui le précède est nulle
      setState(() {
        _selectedFilters = result ?? kInitialilFilters;
      });
      // print(result);
    }
    // else {
    //   Navigator.of(context).pop(); || 1 idem
    // }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.gutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleMealFavoriteStatus: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    String activePageTitle = CATEGORY;

    if (_selectPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleMealFavoriteStatus: _toggleMealFavoriteStatus,
      );
      activePageTitle = FAVORITE;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
