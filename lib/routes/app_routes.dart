import 'package:flutter/material.dart';
import 'package:plateron_app/features/cart/presentation/screens/cart.dart';
import 'package:plateron_app/features/food_item/presentation/screens/food_item_screen.dart';
import 'package:plateron_app/features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splashRoute = '/';

  static const String foodItemRoute = '/food_item';

  static const String cartRoute = '/cart';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.foodItemRoute:
        return MaterialPageRoute(builder: (_) => const FoodItemScreen());
      case AppRoutes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
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
