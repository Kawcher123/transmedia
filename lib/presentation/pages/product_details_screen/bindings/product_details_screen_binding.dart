import 'package:get/get.dart';

import '../controllers/product_details_screen_controller.dart';

class ProductDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsScreenController>(
      () => ProductDetailsScreenController(),
    );
  }
}
