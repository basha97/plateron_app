import 'package:plateron_app/models/food_item.dart';
import 'package:riverpod/riverpod.dart';

class FoodItemList extends StateNotifier<List<FoodItem>> {
  FoodItemList([List<FoodItem>? items]) : super(items ?? []);

  void addItem(FoodItem item) {
    state = [...state, item.copyWith(quantity: 1)];
  }

  void incrementQuantity(FoodItem item) {
    state = [
      for (final foodItem in state)
        if (foodItem.id == item.id)
          FoodItem(
            id: item.id,
            name: item.name,
            price: item.price,
            imageUrl: item.imageUrl,
            quantity: item.quantity! + 1,
          )
        else
          foodItem,
    ];
  }

  void decrementQuantity(FoodItem item) {
    if (item.quantity != null && item.quantity! > 1) {
      state = [
        for (final foodItem in state)
          if (foodItem.id == item.id)
            FoodItem(
              id: item.id,
              name: item.name,
              price: item.price,
              imageUrl: item.imageUrl,
              quantity: item.quantity! - 1,
            )
          else
            foodItem,
      ];
    } else {
      state = state.where((foodItem) => foodItem.id != item.id).toList();
    }
  }
}
