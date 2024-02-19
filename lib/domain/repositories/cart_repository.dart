import 'package:dartz/dartz.dart';
import 'package:transmedia/domain/entities/cart_entity.dart';

import '../failures/failures.dart';

abstract class CartRepository
{
  Future<Either<Failure, List<CartEntity>>> getCartListFromDatasource();
}