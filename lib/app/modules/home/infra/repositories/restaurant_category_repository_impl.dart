import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_category_info.dart';
import 'package:gnu_delivery/app/modules/home/domain/repositories/restaurant_category_repository.dart';
import 'package:gnu_delivery/app/modules/home/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/home/infra/datasources/restaurant_datasource.dart';

part 'restaurant_category_repository_impl.g.dart';

@Injectable(singleton: false)
class RestaurantCategoryRepositoryImpl implements RestaurantCategoryRepository {
  final RestaurantDataSource restaurantCategoryDataSource;

  RestaurantCategoryRepositoryImpl(this.restaurantCategoryDataSource);

  @override
  Future<Either<Failure, List<RestaurantCategoryInfo>>>
      getRestaurantCategories() async {
    try {
      var restaurantCategories =
          await restaurantCategoryDataSource.getRestaurantCategories();
      return Right(restaurantCategories);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }
}
