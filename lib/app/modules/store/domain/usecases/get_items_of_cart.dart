import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_item_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/repositories/restaurant_repository.dart';
import 'package:gnu_delivery/app/modules/store/domain/services/conectivity_service.dart';

part 'get_items_of_cart.g.dart';

abstract class GetItemsOfCart {
  Future<Either<Failure, List<OrderItemInfo>>> call({
    int restaurantId,
    dynamic userId,
    dynamic orderId,
  });
}

@Injectable(singleton: false)
class GetItemsOfCartImpl implements GetItemsOfCart {
  final RestaurantRepository restaurantRepository;
  final ConnectivityService connectivityService;

  GetItemsOfCartImpl(this.restaurantRepository, this.connectivityService);

  @override
  Future<Either<Failure, List<OrderItemInfo>>> call({
    int restaurantId,
    dynamic userId,
    dynamic orderId,
  }) async {
    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await restaurantRepository.getItemsOfCart(
      restaurantId: restaurantId,
      userId: userId,
      orderId: orderId,
    );
  }
}
