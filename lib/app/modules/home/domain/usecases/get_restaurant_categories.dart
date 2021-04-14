import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_category_info.dart';
import 'package:gnu_delivery/app/modules/home/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/home/domain/repositories/restaurant_category_repository.dart';
import 'package:gnu_delivery/app/modules/home/domain/services/conectivity_service.dart';

part 'get_restaurant_categories.g.dart';

abstract class GetCategories {
  Future<Either<Failure, List<RestaurantCategoryInfo>>> call();
}

@Injectable(singleton: false)
class GetCategoriesImpl implements GetCategories {
  final RestaurantCategoryRepository restaurantCategoryRepository;
  final ConnectivityService connectivityService;

  GetCategoriesImpl(
      this.restaurantCategoryRepository, this.connectivityService);

  @override
  Future<Either<Failure, List<RestaurantCategoryInfo>>> call() async {
    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }
    return await restaurantCategoryRepository.getRestaurantCategories();
  }
}
