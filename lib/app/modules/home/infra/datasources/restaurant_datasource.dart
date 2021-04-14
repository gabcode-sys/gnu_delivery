import 'package:gnu_delivery/app/modules/home/infra/models/restaurant_category_model.dart';
import 'package:gnu_delivery/app/modules/home/infra/models/restaurant_model.dart';

abstract class RestaurantDataSource {
  Future<List<RestaurantModel>> searchRestaurantbyName({String name});
  Future<List<RestaurantModel>> searchRestaurantbyCategory({int category});
  Future<List<RestaurantCategoryModel>> getRestaurantCategories();
}
