

import 'package:dartz/dartz.dart';
import 'package:transmedia/domain/entities/cart_entity.dart';
import 'package:transmedia/domain/failures/failures.dart';
import 'package:transmedia/domain/repositories/cart_repository.dart';

class CartUseCase{

  final CartRepository _cartRepository;

  CartUseCase(this._cartRepository);


  Future<Either<Failure, List<CartEntity>>> addToCartUseCase(CartEntity cartEntity)async
  {
   return  await _cartRepository.addToCartToDatabase(cartEntity);
  }

  Future updateCartUseCase(CartEntity cartEntity)async
  {

  }

  Future deleteFromCartUseCase(CartEntity cartEntity)async
  {

  }


  Future<Either<Failure, List<CartEntity>>> getCartListUseCase()async
  {
    return await _cartRepository.getCartListFromDatasource();
  }
}