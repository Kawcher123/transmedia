import 'package:get/get.dart';
import 'package:transmedia/domain/entities/cart_entity.dart';
import 'package:transmedia/domain/use_cases/cart_use_case.dart';

class CartScreenController extends GetxController {
  //TODO: Implement CartScreenController

  final CartUseCase _cartUseCase;

  CartScreenController(this._cartUseCase);

  final cartList=<CartEntity>[].obs;
  final cartLoaded=false.obs;
  @override
  void onInit() {
    super.onInit();
    getCartList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getCartList()async{
    final result =await _cartUseCase.getCartListUseCase();

    result.fold((failure) {}, (cart) {
      print('ProductDetailsScreenController.get cart list:$cart');
      cartLoaded.value=true;
      cartList.assignAll(cart);
    });
  }




  void quantityIncrement() {

  }

  void quantityDecrement() {

  }
}
