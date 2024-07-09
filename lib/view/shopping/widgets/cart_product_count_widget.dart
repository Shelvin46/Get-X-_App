import 'package:chat_app/controllers/shop/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartProductsCountWidget extends StatelessWidget {
  const CartProductsCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            GetX<CartController>(builder: (controller) {
              return Text(controller.cartCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
