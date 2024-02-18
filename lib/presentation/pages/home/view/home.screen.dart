import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transmedia/presentation/global_widgets/product_card_widget.dart';

import '../controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Obx(() => controller.productLoaded.isTrue? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: GridView.count(
            primary: false,
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.65,
            children: List.generate(controller.productList.length, (index) {
              return GestureDetector(
                onTap: () {},
                child: ProductCardWidget(
                  productData: controller.productList[index],
                ),
              );
            })),
      ):const Center(child: CircularProgressIndicator())),
    );
  }
}
