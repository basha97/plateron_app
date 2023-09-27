import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plateron_app/features/food_item/presentation/providers/food_item_provider.dart';
import 'package:plateron_app/models/food_item.dart';

class AddIncrementOrDecrementWidget extends HookConsumerWidget {
  const AddIncrementOrDecrementWidget({Key? key, required this.currentItem})
      : super(key: key);
  final FoodItem currentItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
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
    );
  }
}
