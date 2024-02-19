import 'package:flutter/material.dart';
import 'package:transmedia/data/data_sources/api/api_manager.dart';
import 'package:transmedia/data/data_sources/api/api_url.dart';
import 'package:transmedia/data/data_sources/local/cart_data_source.dart';
import 'package:transmedia/data/data_sources/local/sqlite_data_service.dart';
import 'package:transmedia/data/data_sources/remote/products_data_source.dart';
import 'package:transmedia/data/exceptions/customExceptions.dart';
import 'package:transmedia/data/models/cart_model.dart';
import 'package:transmedia/data/models/product_model.dart';

class CartLocalDatasourceImpl implements CartLocalDatasource {
  final SqliteService _sqliteService = SqliteService.sqliteService;

  @override
  Future<List<CartModel>> getAllCartListFromDB() async {
    List<CartModel> cartList = [];

    try {
      cartList = await _sqliteService.readAll();
    } on Exception catch (e) {
      // TODO

      rethrow;
    }
    return cartList;
  }

  @override
  Future<List<CartModel>> addToCartListFromDB(CartModel cartModel) async {
    // TODO: implement addToCartListFromDB
    List<CartModel> cartList = [];

    try {
      int id = await _sqliteService.createItem(cartModel);
      cartList=await _sqliteService.readAll();
    } on Exception catch (e) {
      // TODO

      debugPrint('error in add to cart datA SOURCE: $e');
      rethrow;
    }
    return cartList;
  }

  @override
  Future<List<CartModel>> deleteFromCartListFromDB(CartModel cartModel) {
    // TODO: implement deleteFromCartListFromDB
    throw UnimplementedError();
  }

  @override
  Future<List<CartModel>> updateCartListFromDB(CartModel cartModel) {
    // TODO: implement updateCartListFromDB
    throw UnimplementedError();
  }
}
