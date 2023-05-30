import 'package:flutter/material.dart';
import 'package:meals_app/presentation/widgets/drawer_list.dart';
import 'package:meals_app/utils/constants.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String idScreen) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  DRAWER_HEAD_TEXT,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          DrawerList(
            icon: Icons.restaurant,
            title: DRAWER_MAIN_TITLE_MEAL,
            onTap: () => onSelectScreen('meals'),
          ),
          DrawerList(
            icon: Icons.settings,
            title: DRAWER_MAIN_TITLE_FILTERS,
            onTap: () => onSelectScreen('filters'),
          ),
        ],
      ),
    );
  }
}
