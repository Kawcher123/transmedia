import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmedia/domain/entities/product_entity.dart';
import 'package:transmedia/presentation/common/ui.dart';
import 'package:transmedia/presentation/global_widgets/custom_triangle_paint.dart';
import 'package:transmedia/presentation/global_widgets/image_widget.dart';

import '../../core/app.constant.dart';

class ProductCardWidget extends StatelessWidget {
  ProductCardWidget({
    Key? key,
    this.width,
    this.productData,
  }) : super(key: key);
  double? width;
  ProductEntity? productData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: size.width * .5,
        width: width ?? size.width * .4,
        decoration: Ui.commonUi.getBoxDecoration(
          radius: boxRadius,
          color: Get.theme.cardColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(boxRadius),
          child: CustomPaint(
            size: Size(size.width * .5, width ?? size.width * .4),
            painter: DrawTriangle(colorCode: int.parse('0xFFFFFF')),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                    child: ImageWidget(
                  imageUrl: productData!.thumbnail ?? '',
                  height: size.width * .35,
                  width: width ?? size.width * .4,
                  boxFit: contain,
                )),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: Text(
                    'name',
                    style: TextStyle(fontSize: mediumFontSize, letterSpacing: 1.0),
                    maxLines: 1,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal:horizontalPadding,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Color: '.tr,
                          style: TextStyle(
                            fontSize: mediumFontSize,
                            color: Get.theme.disabledColor,
                          ),
                        ),
                        Text(
                          'name',
                          style: TextStyle(
                            fontSize: mediumFontSize,
                            color: Get.theme.disabledColor,
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: Container(
                    decoration: Ui.commonUi.getBoxDecoration(
                      radius: boxRadius,
                      color: Get.theme.dividerColor.withOpacity(0.15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                      child: Text(
                        'price',
                        style: TextStyle(fontSize: mediumFontSize, color: Get.theme.textTheme.bodyText1!.color),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
