import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plateron_app/features/food_item/presentation/providers/food_item_provider.dart';
import 'package:plateron_app/models/food_item.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItemListProvider = ref.watch(foodItemProvider);
    final total = ref.read(foodItemProvider.notifier).calculateTotalAmount();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: false,
      ),
      body: foodItemListProvider.isEmpty
          ? Center(child: FlutterLogo())
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                children: [
                  const CartListViewWidget(),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Row(
                      children: [
                        Text('Total'),
                        const Spacer(),
                        Text('\$ ${total}')
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class CartListViewWidget extends HookConsumerWidget {
  const CartListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItemListProvider = ref.watch(foodItemProvider);
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => CartListItemWidget(
          foodItem: foodItemListProvider[index],
        ),
        separatorBuilder: (_, index) => const Divider(),
        itemCount: foodItemListProvider.length,
      ),
    );
  }
}

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
              Text(foodItem.name),
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
          Text('\$ ${(foodItem.price * (foodItem.quantity ?? 1))}'),
        ],
      ),
    );
  }
}
