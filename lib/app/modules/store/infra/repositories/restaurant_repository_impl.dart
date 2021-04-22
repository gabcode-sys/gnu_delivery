import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_item_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_aditional_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_category_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/restaurant_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/repositories/restaurant_repository.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/infra/datasources/restaurant_datasource.dart';

part 'restaurant_repository_impl.g.dart';

@Injectable(singleton: false)
class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantDataSource restaurantDataSource;

  RestaurantRepositoryImpl(this.restaurantDataSource);

  @override
  Future<Either<Failure, List<RestaurantInfo>>> searchRestaurantbyId(
      {int restaurantId}) async {
    try {
      var restaurant = await restaurantDataSource.searchRestaurantbyId(
          restaurantId: restaurantId);
      return Right(restaurant);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }

  @override
  Future<Either<Failure, List<ProductCategoryInfo>>> getProductCategories(
      int restaurantId) async {
    try {
      var restaurant =
          await restaurantDataSource.getProductCategories(restaurantId);
      return Right(restaurant);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }

  @override
  Future<Either<Failure, List<ProductInfo>>> searchProductbyCategory(
      {int productCategory, int restaurantId}) async {
    try {
      var product = await restaurantDataSource.searchProductbyCategory(
          productCategory, restaurantId);
      return Right(product);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }

  @override
  Future<Either<Failure, List<ProductInfo>>> searchProductbyId(
      {int productId, int restaurantId}) async {
    try {
      var product =
          await restaurantDataSource.searchProductbyId(productId, restaurantId);
      return Right(product);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }

  @override
  Future<Either<Failure, List<ProductAditionalInfo>>> getProductAditionals(
      {int restaurantId, int productId}) async {
    try {
      var productAditionals = await restaurantDataSource.getProductAditionals(
          restaurantId: restaurantId, productId: productId);
      return Right(productAditionals);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }

  @override
  Future<Either<Failure, OrderInfo>> createNewOrder(
      {int restaurantId, dynamic userId}) async {
    try {
      var newOrder = await restaurantDataSource.createNewOrder(
          restaurantId: restaurantId, userId: userId);
      return Right(newOrder);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }

  @override
  Future<Either<Failure, OrderInfo>> getOpenedOrder(
      {int restaurantId, userId}) async {
    try {
      var openedOrder = await restaurantDataSource.getOpenedOrder(
          restaurantId: restaurantId, userId: userId);
      return Right(openedOrder);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }

  @override
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
  }) async {
    try {
      var orderItem = await restaurantDataSource.createNewOrderItem(
        orderId: orderId,
        productId: productId,
        userId: userId,
        restaurantId: restaurantId,
        name: name,
        count: count,
        type: type,
        aditionals: aditionals,
        observation: observation,
      );
      return Right(orderItem);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }

  @override
  Future<Either<Failure, List<OrderItemInfo>>> getItemsOfCart({
    int restaurantId,
    dynamic userId,
    dynamic orderId,
  }) async {
    try {
      var cartItems = await restaurantDataSource.getItemsOfCart(
          restaurantId: restaurantId, userId: userId, orderId: orderId);
      return Right(cartItems);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }
}
