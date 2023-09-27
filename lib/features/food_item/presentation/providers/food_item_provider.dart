import 'package:plateron_app/features/food_item/presentation/providers/food_list_notifier.dart';
import 'package:plateron_app/models/food_item.dart';
import 'package:riverpod/riverpod.dart';

final foodItemProvider = StateNotifierProvider<FoodItemList, List<FoodItem>>(
  (ref) => FoodItemList(),
);
