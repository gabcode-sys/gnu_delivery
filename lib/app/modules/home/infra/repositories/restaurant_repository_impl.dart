import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_info.dart';
import 'package:gnu_delivery/app/modules/home/domain/repositories/restaurant_repository.dart';
import 'package:gnu_delivery/app/modules/home/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/home/infra/datasources/restaurant_datasource.dart';

part 'restaurant_repository_impl.g.dart';

@Injectable(singleton: false)
class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantDataSource restaurantDataSource;

  RestaurantRepositoryImpl(this.restaurantDataSource);

  @override
  Future<Either<Failure, List<RestaurantInfo>>> searchRestaurantbyName(
      {String name}) async {
    try {
      var restaurant =
          await restaurantDataSource.searchRestaurantbyName(name: name);
      return Right(restaurant);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }

  @override
  Future<Either<Failure, List<RestaurantInfo>>> searchRestaurantbyCategory(
      {int category}) async {
    try {
      var restaurant = await restaurantDataSource.searchRestaurantbyCategory(
          category: category);
      return Right(restaurant);
    } catch (e) {
      return Left(ErrorNotFound(message: "Objeto não encontrado"));
    }
  }
}
