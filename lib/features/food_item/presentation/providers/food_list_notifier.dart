import 'package:plateron_app/models/food_item.dart';
import 'package:riverpod/riverpod.dart';

class FoodItemList extends StateNotifier<List<FoodItem>> {
  FoodItemList([List<FoodItem>? items]) : super(items ?? []);

  void addItem(FoodItem item) {
    state = [...state, item];
  }
}
