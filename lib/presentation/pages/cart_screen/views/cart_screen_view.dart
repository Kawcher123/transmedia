import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_screen_controller.dart';

class CartScreenView extends GetView<CartScreenController> {
  const CartScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CartScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
