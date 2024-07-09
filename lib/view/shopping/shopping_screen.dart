import 'package:chat_app/controllers/shop/cart_controller.dart';
import 'package:chat_app/controllers/shop/shopping_controller.dart';
import 'package:chat_app/view/shopping/widgets/cart_product_count_widget.dart';
import 'package:chat_app/view/shopping/widgets/product_tile_widget.dart';
import 'package:chat_app/view/shopping/widgets/total_amount_show_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/instance_manager.dart';

/// [ShoppingScreen] is a StatelessWidget that is used to display the shopping screen.
/// This screen is used to display the products that are available for shopping.
///
class ShoppingScreen extends StatelessWidget {
  // When the initial time this page will call the function all stuff present in the ShoppingController class
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 20),
            GetX<ShoppingController>(builder: (controller) {
              return CustomScrollView(
                primary: false,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = controller.products[index];
                        return ProductTileWidget(
                          product: product,
                        );
                      },
                      childCount: controller.products.length,
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 100),
            const TotalAmountWidget(),
            const SizedBox(height: 20),
            const CartProductsCountWidget()
          ],
        ),
      )),
    );
  }
}
