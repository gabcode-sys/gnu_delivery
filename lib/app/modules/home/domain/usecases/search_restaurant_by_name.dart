import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_info.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_search.dart';
import 'package:gnu_delivery/app/modules/home/domain/repositories/restaurant_repository.dart';
import 'package:gnu_delivery/app/modules/home/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/home/domain/services/conectivity_service.dart';

part 'search_restaurant_by_name.g.dart';

abstract class SearchRestaurantByName {
  Future<Either<Failure, List<RestaurantInfo>>> call(
      RestaurantSearch restaurantSearch);
}

@Injectable(singleton: false)
class SearchRestaurantByNameImpl implements SearchRestaurantByName {
  final RestaurantRepository restaurantRepository;
  final ConnectivityService connectivityService;

  SearchRestaurantByNameImpl(
      this.restaurantRepository, this.connectivityService);

  @override
  Future<Either<Failure, List<RestaurantInfo>>> call(
      RestaurantSearch restaurantSearch) async {
    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }
    return await restaurantRepository.searchRestaurantbyName(
        name: restaurantSearch.name);
  }
}
