import 'package:dartz/dartz.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_category_info.dart';
import 'package:gnu_delivery/app/modules/home/domain/errors/errors.dart';

abstract class RestaurantCategoryRepository {
  Future<Either<Failure, List<RestaurantCategoryInfo>>>
      getRestaurantCategories();
}
