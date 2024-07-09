import 'package:chat_app/models/shop/products.dart';
import 'package:get/state_manager.dart';

/// Controllers are based on the functionality of the application not a specific screen.
/// May be your one controller is used in multiple screens.
/// May be your one controller is used in a single screen.
/// May be your one screen is managed by multiple controllers.
/// This controller is used to manage the cart of the user.
class CartController extends GetxController {
  var cartItems = <double>[].obs;
  var cartProducts = <Products>[].obs;

  void addToCart(double id) {
    cartItems.add(id);
  }

  void removeFromCart(double id) {
    cartItems.remove(id);
    cartProducts.removeWhere((product) => product.id == id);
  }

  void addProductToCart(Products product) {
    cartProducts.add(product);
    addToCart(product.id);
  }

  int get cartCount => cartItems.length;
  // This will return the total amount of the products in the cart.
  double get totalAmount => cartProducts.fold(
        0,
        (sum, item) => sum + item.price,
      );
}
