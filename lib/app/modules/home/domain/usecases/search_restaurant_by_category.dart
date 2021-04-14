import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_info.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_search.dart';
import 'package:gnu_delivery/app/modules/home/domain/repositories/restaurant_repository.dart';
import 'package:gnu_delivery/app/modules/home/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/home/domain/services/conectivity_service.dart';

part 'search_restaurant_by_category.g.dart';

abstract class SearchRestaurantByCategory {
  Future<Either<Failure, List<RestaurantInfo>>> call(
      RestaurantSearch restaurantSearch);
}

@Injectable(singleton: false)
class SearchRestaurantByCategoryImpl implements SearchRestaurantByCategory {
  final RestaurantRepository restaurantRepository;
  final ConnectivityService connectivityService;

  SearchRestaurantByCategoryImpl(
      this.restaurantRepository, this.connectivityService);

  @override
  Future<Either<Failure, List<RestaurantInfo>>> call(
      RestaurantSearch restaurantSearch) async {
    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await restaurantRepository.searchRestaurantbyCategory(
        category: restaurantSearch.category);
  }
}
