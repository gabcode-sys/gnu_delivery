import 'package:dartz/dartz.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_item_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_aditional_info.dart';
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
  Future<Either<Failure, List<ProductAditionalInfo>>> getProductAditionals(
      {int restaurantId, int productId});
  Future<Either<Failure, OrderInfo>> createNewOrder(
      {int restaurantId, dynamic userId});
  Future<Either<Failure, OrderInfo>> getOpenedOrder(
      {int restaurantId, dynamic userId});
  Future<Either<Failure, OrderItemInfo>> createNewOrderItem({
    dynamic orderId,
    int productId,
    dynamic userId,
    int restaurantId,
    String name,
    int count,
    String type,
    Map<String, Map<String, dynamic>> aditionals,
    String observation,
  });
}
