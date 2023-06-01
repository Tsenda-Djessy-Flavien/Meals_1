import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/presentation/pages/categories_screen.dart';
import 'package:meals_app/presentation/pages/filters_screen.dart';
import 'package:meals_app/presentation/pages/meals_screen.dart';
import 'package:meals_app/presentation/state%20management/providers/favorites_provider.dart';
import 'package:meals_app/presentation/state%20management/providers/filters_provider.dart';
import 'package:meals_app/presentation/widgets/main_drawer.dart';
import 'package:meals_app/utils/constants.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectPageIndex = 0;

  void _selectPage(newIndex) {
    setState(() {
      _selectPageIndex = newIndex;
    });
  }

  // quand on press sur le DrawerList,
  // on obtient une valeur differente à l'interieur de cette func
  void _setScreen(String idScreen) async {
    Navigator.of(context).pop(); // || 1 -> do that
    if (idScreen == 'filters') {
      // Navigator.of(context).pop(); || 1 idem
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (context) => const FiltersScreen()),
      );
    }
    // else {
    //   Navigator.of(context).pop(); || 1 idem
    // }
  }

  @override
  Widget build(BuildContext context) {
    // mettre en place les recepteurs pour nos Provider
    /// .read() -> obtenir la data de notre Provider;
    /// .watch() -> mettre en place un listener // lorsque la data change
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      // onToggleMealFavoriteStatus: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    String activePageTitle = CATEGORY;

    if (_selectPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
        // onToggleMealFavoriteStatus: _toggleMealFavoriteStatus,
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
