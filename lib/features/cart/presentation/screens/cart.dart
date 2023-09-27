import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plateron_app/features/cart/presentation/widgets/cart_list_view.dart';
import 'package:plateron_app/features/cart/presentation/widgets/cart_total.dart';
import 'package:plateron_app/features/food_item/presentation/providers/food_item_provider.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItemListProvider = ref.watch(foodItemProvider);

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
                children: const [
                  CartListViewWidget(),
                  Divider(),
                  CartTotalWidget(),
                ],
              ),
            ),
    );
  }
}
