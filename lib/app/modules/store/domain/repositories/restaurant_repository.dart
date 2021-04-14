import 'package:dartz/dartz.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_category.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_category_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/restaurant_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<RestaurantInfo>>> searchRestaurantbyId(
      {int restaurantId});
  Future<Either<Failure, List<ProductCategoryInfo>>> getProductCategories(
      int restaurantId);
  Future<Either<Failure, List<ProductInfo>>> searchProductbyCategory(
      {int productCategory, int restaurantId});
  Future<Either<Failure, List<ProductInfo>>> searchProductbyId(
      {int productId, int restaurantId});
}
