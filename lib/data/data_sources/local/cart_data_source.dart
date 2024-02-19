
import 'package:transmedia/data/models/cart_model.dart';

abstract class CartLocalDatasource {
  Future<List<CartModel>> getAllCartListFromDB();
}

