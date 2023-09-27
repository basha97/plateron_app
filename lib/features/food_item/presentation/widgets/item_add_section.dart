import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plateron_app/features/food_item/presentation/providers/food_item_provider.dart';
import 'package:plateron_app/models/food_item.dart';
import 'package:plateron_app/shared/theme/style_manager.dart';
import 'package:plateron_app/shared/widgets/increment_or_decrement_item.dart';

class ItemAddSection extends HookConsumerWidget {
  const ItemAddSection({Key? key, required this.foodItem}) : super(key: key);
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItemListProvider = ref.watch(foodItemProvider);
    final currentItem = findItemInList(foodItemListProvider, foodItem);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: currentItem != null
          ? AddIncrementOrDecrementWidget(
              key: ValueKey('food-item'),
              currentItem: currentItem,
            )
          : GestureDetector(
              onTap: () =>
                  ref.read(foodItemProvider.notifier).addItem(foodItem),
              child: Text('ADD',
                  style: getH2Medium().copyWith(color: Colors.green)),
            ),
    );
  }
}

FoodItem? findItemInList(List<FoodItem> addedItems, FoodItem currentItem) {
  return addedItems.firstWhereOrNull((item) => item.id == currentItem.id);
}
