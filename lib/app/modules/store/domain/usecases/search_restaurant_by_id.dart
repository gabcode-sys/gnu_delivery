import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/restaurant_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/repositories/restaurant_repository.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/services/conectivity_service.dart';

part 'search_restaurant_by_id.g.dart';

abstract class SearchRestaurantById {
  Future<Either<Failure, List<RestaurantInfo>>> call(int restaurantId);
}

@Injectable(singleton: false)
class SearchRestaurantByIdImpl implements SearchRestaurantById {
  final RestaurantRepository restaurantRepository;
  final ConnectivityService connectivityService;

  SearchRestaurantByIdImpl(this.restaurantRepository, this.connectivityService);

  @override
  Future<Either<Failure, List<RestaurantInfo>>> call(int restaurantId) async {
    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await restaurantRepository.searchRestaurantbyId(
        restaurantId: restaurantId);
  }
}
