import 'package:flutter/material.dart';
import 'package:plateron_app/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plateron App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.splashRoute,
      onGenerateRoute: RoutesGenerator.getRoute,
    );
  }
}
