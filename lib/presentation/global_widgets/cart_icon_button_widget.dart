import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmedia/presentation/common/ui.dart';
import 'package:transmedia/presentation/navigation/routes.dart';

class CartIconBtnWithCounter extends StatelessWidget {

  final Color? color;
  final String topValue;

  CartIconBtnWithCounter({
    super.key,
    this.color,
    this.topValue = '0',
  });

  final Size _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Get.toNamed(Routes.CART_SCREEN);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Ui.commonUi.getIconButton(
            height: _size.width * .1,
            width: _size.width * .1,
            color: Get.theme.primaryColor.withOpacity(0.2),
            radius: 30,
            child: Icon(Icons.shopping_basket_outlined,color: Get.theme.primaryColor,)
          ),
          Positioned(
            top: -3,
            right: 0,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: const Color(0xFFFF4848),
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Center(
                child: Text(
                  topValue,
                  style: const TextStyle(
                    fontSize: 10,
                    height: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
