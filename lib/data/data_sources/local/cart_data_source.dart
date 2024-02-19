
import 'package:transmedia/data/models/cart_model.dart';

abstract class CartLocalDatasource {
  Future<List<CartModel>> getAllCartListFromDB();
  Future<List<CartModel>> addToCartListFromDB(CartModel cartModel);
  Future<List<CartModel>> updateCartListFromDB(CartModel cartModel);
  Future<List<CartModel>> deleteFromCartListFromDB(CartModel cartModel);
}

