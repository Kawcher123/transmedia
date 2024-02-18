import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_details_screen_controller.dart';

class ProductDetailsScreenView extends GetView<ProductDetailsScreenController> {
  const ProductDetailsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetailsScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductDetailsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
