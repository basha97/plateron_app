import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plateron_app/features/food_item/presentation/providers/food_item_provider.dart';
import 'package:plateron_app/models/food_item.dart';
import 'package:plateron_app/shared/theme/style_manager.dart';

class ItemPriceSection extends StatelessWidget {
  const ItemPriceSection({Key? key, required this.foodItem}) : super(key: key);
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$ ${foodItem.price}',
          style: getH1Medium(),
        ),
        const Spacer(),
        ItemAddSection(foodItem: foodItem)
      ],
    );
  }
}

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
          ? Row(
              children: [
                GestureDetector(
                  onTap: () => ref
                      .read(foodItemProvider.notifier)
                      .decrementQuantity(currentItem),
                  child: Icon(Icons.remove, size: 14),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('${currentItem.quantity}'),
                ),
                GestureDetector(
                  onTap: () => ref
                      .read(foodItemProvider.notifier)
                      .incrementQuantity(currentItem),
                  child: Icon(Icons.add, size: 14),
                ),
              ],
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
