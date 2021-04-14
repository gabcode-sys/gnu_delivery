import 'package:dartz/dartz.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_info.dart';
import 'package:gnu_delivery/app/modules/home/domain/errors/errors.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<RestaurantInfo>>> searchRestaurantbyName(
      {String name});
  Future<Either<Failure, List<RestaurantInfo>>> searchRestaurantbyCategory(
      {int category});
}
