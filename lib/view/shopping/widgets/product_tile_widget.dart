import 'package:chat_app/controllers/shop/cart_controller.dart';
import 'package:chat_app/models/shop/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductTileWidget extends StatelessWidget {
  // final cartController = Get.put(CartController());

  const ProductTileWidget({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  GetX<CartController>(builder: (controller) {
                    return _buildCartButton(controller, product);
                  })
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

// Define the method outside the widget tree
  ElevatedButton _buildCartButton(CartController controller, Products product) {
    final isInCart = controller.cartItems.contains(product.id);
    return ElevatedButton(
      onPressed: isInCart
          ? () {
              controller.removeFromCart(product.id);
            }
          : () {
              controller.addProductToCart(product);
            },
      child: isInCart ? const Text("Remove") : const Text("Add to Cart"),
    );
  }
}
