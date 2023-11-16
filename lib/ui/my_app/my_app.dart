import 'package:flutter/material.dart';
import 'package:unsplash/domain/navigation/main_navigation.dart';
import 'package:unsplash/ui/resources/styles.dart';

class MyApp extends StatelessWidget {
  final mainNavigation = MainNavigation();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          shape: AppStyles.appbarShape,
          color: AppColors.appBarcolor,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: MainNavigationRouteNames.auth,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoutes,
    );
  }
}
