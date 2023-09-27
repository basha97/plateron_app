import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plateron_app/features/food_item/presentation/providers/food_item_provider.dart';
import 'package:plateron_app/shared/theme/font_manager.dart';
import 'package:plateron_app/shared/theme/style_manager.dart';

class CartTotalWidget extends HookConsumerWidget {
  const CartTotalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(foodItemProvider);
    final total = ref.read(foodItemProvider.notifier).calculateTotalAmount();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
    );
  }
}
