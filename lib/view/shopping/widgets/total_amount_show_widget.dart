import 'package:chat_app/controllers/shop/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetX<CartController>(builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Total : ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "\$${controller.totalAmount}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        );
      }),
    );
  }
}
