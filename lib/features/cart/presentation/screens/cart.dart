import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plateron_app/features/cart/presentation/widgets/cart_list_view.dart';
import 'package:plateron_app/features/food_item/presentation/providers/food_item_provider.dart';
import 'package:plateron_app/shared/theme/font_manager.dart';
import 'package:plateron_app/shared/theme/style_manager.dart';

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
                        Text(
                          'Total',
                          style: getH1Medium().copyWith(
                            fontWeight: FontWeightManager.semiBold,
                            fontSize: FontSize.s16,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$ ${total}',
                          style: getH1Medium().copyWith(
                            fontWeight: FontWeightManager.semiBold,
                            fontSize: FontSize.s16,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
