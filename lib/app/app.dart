import 'package:flutter/material.dart';
import 'package:meals_app/configs/congifs.dart';
import 'package:meals_app/presentation/pages/tabs_screen.dart';
import 'package:meals_app/utils/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
