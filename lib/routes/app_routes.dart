import 'package:flutter/material.dart';
import 'package:plateron_app/features/food_item/presentation/screens/food_item_screen.dart';
import 'package:plateron_app/features/splash/screens/splash_screen.dart';

class AppRoutes {
  static const String splashRoute = '/';

  static const String foodItemRoute = '/food_item';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.foodItemRoute:
        return MaterialPageRoute(builder: (_) => const FoodItemScreen());
      default:
        return unDefinedRoute();
    }
  }

  /// Un-defined-route
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No routes found')),
        body: const Center(child: Text('No routes found')),
      ),
    );
  }
}
