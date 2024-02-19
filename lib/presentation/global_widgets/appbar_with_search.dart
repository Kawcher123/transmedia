import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmedia/presentation/global_widgets/cart_icon_button_widget.dart';

class AppBarWithSearchWidget extends StatelessWidget with PreferredSizeWidget{
  const AppBarWithSearchWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Get.theme.cardColor,
      elevation: 0,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //SearchBar(),
            const SizedBox(
              width: 10,
            ),
            CartIconBtnWithCounter(
                color: const Color(0xFF979797).withOpacity(0.1),
                topValue: '0',

            ),

            const SizedBox(
              width: 10,
            )
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}