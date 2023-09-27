import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plateron_app/features/cart/presentation/widgets/cart_list_item.dart';
import 'package:plateron_app/features/food_item/presentation/providers/food_item_provider.dart';

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
        separatorBuilder: (_, __) => const Divider(),
        itemCount: foodItemListProvider.length,
      ),
    );
  }
}
