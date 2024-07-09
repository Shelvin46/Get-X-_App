import 'package:chat_app/models/shop/products.dart';
import 'package:get/state_manager.dart';

// The controllers will have the elements which is bind into the UI in MVC pattern.
///[ShoppingController] is a GetxController class which is used to manage the state of the Shopping Screen.
/// Getx have 3 types of controllers:
/// 1. GetxController
/// 2. GetxService
/// 3. GetxView
//  Getx have  3 types of builders:
// 1. GetBuilder
// 2. Obx
// 3. GetX
// GetBuilder is used to rebuild the UI when the state changes, but we need to manually call the update() method to trigger the rebuild. It won't update automatically.
// Obx is used to rebuild the UI when the state changes and it will update automatically.
// GetX is used to rebuild the UI when the state changes and it will update automatically.

// Lifecycle Methods:
// onInit(): Called immediately after the controller is allocated in memory. Ideal for initialization tasks.
// onReady(): Called after the widget is rendered on screen. Ideal for API calls or other tasks that require the widget to be fully rendered.
// onClose(): Called just before the Controller is deleted from memory. Ideal for cleanup tasks.

// State Management Methods:
// update([ids, bool condition]): Manually trigger a UI update. You can optionally pass specific IDs to update only certain parts of the UI.
// refresh(): Refreshes the controller, calling onInit() again.
// dispose(): Called to dispose of the controller and free up resources.

// Utility Methods:
// ever(RxInterface rx, void Function(T) callback): Calls the callback every time the observable changes.
// once(RxInterface rx, void Function(T) callback): Calls the callback only the first time the observable changes.
// debounce(RxInterface rx, void Function(T) callback, Duration time): Calls the callback only once during the specified duration.
// interval(RxInterface rx, void Function(T) callback, Duration time): Calls the callback at regular intervals during the specified duration.

class ShoppingController extends GetxController {
  var products = <Products>[].obs;

  @override
  void onInit() {
    // Fetching the products from the server.
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));

    var responseList = [
      const Products(
          name: 'Product 1',
          image: 'assets/images/product1.jpg',
          price: 100,
          id: 1,
          description: 'This is a product 1'),
      const Products(
          name: 'Product 2',
          image: 'assets/images/product2.jpg',
          price: 200,
          id: 2,
          description: 'This is a product 2'),
      const Products(
          name: 'Product 3',
          image: 'assets/images/product3.jpg',
          price: 300,
          id: 3,
          description: 'This is a product 3'),
    ];
    // Assigning the response to the products variable which is observed.
    products.value = responseList;
  }
}
