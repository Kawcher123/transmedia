import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transmedia/presentation/global_widgets/appbar_with_search.dart';
import 'package:transmedia/presentation/global_widgets/product_card_widget.dart';

import '../../../../core/app.constant.dart';
import '../controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Get.theme.cardColor,
      appBar: const AppBarWithSearchWidget(),
      body: Obx(() => controller.productLoaded.isTrue? GridView.count(
          primary: true,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          childAspectRatio: 0.65,
          children: List.generate(controller.productList.length, (index) {
            return GestureDetector(
              onTap: () {},
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticalPadding),
                child: ProductCardWidget(
                  productData: controller.productList[index],
                ),
              ),
            );
          })):const Center(child: CircularProgressIndicator())),
    );
  }
}
