import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plateron_app/features/food_item/presentation/providers/food_item_provider.dart';
import 'package:plateron_app/models/food_item.dart';
import 'package:plateron_app/shared/theme/font_manager.dart';
import 'package:plateron_app/shared/theme/style_manager.dart';

class CartListItemWidget extends HookConsumerWidget {
  const CartListItemWidget({Key? key, required this.foodItem})
      : super(key: key);
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(
                foodItem.name,
                style: getH1Medium().copyWith(
                  fontWeight: FontWeightManager.semiBold,
                  fontSize: FontSize.s18,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => ref
                          .read(foodItemProvider.notifier)
                          .decrementQuantity(foodItem),
                      child: Icon(Icons.remove, size: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text('${foodItem.quantity}'),
                    ),
                    GestureDetector(
                      onTap: () => ref
                          .read(foodItemProvider.notifier)
                          .incrementQuantity(foodItem),
                      child: Icon(Icons.add, size: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '\$ ${(foodItem.price * (foodItem.quantity ?? 1))}',
            style: getH1Medium().copyWith(
                fontWeight: FontWeightManager.semiBold, fontSize: FontSize.s14),
          ),
        ],
      ),
    );
  }
}
