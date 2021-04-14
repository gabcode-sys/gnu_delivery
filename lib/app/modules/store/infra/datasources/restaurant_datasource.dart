import 'package:gnu_delivery/app/modules/store/infra/models/product_category_model.dart';
import 'package:gnu_delivery/app/modules/store/infra/models/product_model.dart';
import 'package:gnu_delivery/app/modules/store/infra/models/restaurant_model.dart';

abstract class RestaurantDataSource {
  Future<List<ProductModel>> searchProductbyCategory(
      int productCategory, int restaurantId);
  Future<List<RestaurantModel>> searchRestaurantbyId({int restaurantId});
  Future<List<ProductCategoryModel>> getProductCategories(int restaurantId);
  Future<List<ProductModel>> searchProductbyId(int productId, int restaurantId);
}