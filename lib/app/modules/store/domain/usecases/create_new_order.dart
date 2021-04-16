import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/repositories/restaurant_repository.dart';
import 'package:gnu_delivery/app/modules/store/domain/services/conectivity_service.dart';

part 'create_new_order.g.dart';

abstract class CreateNewOrder {
  Future<Either<Failure, OrderInfo>> call(int restaurantId, dynamic userId);
}

@Injectable(singleton: false)
class CreateNewOrderImpl implements CreateNewOrder {
  final RestaurantRepository restaurantRepository;
  final ConnectivityService connectivityService;

  CreateNewOrderImpl(this.restaurantRepository, this.connectivityService);

  @override
  Future<Either<Failure, OrderInfo>> call(
      int restaurantId, dynamic userId) async {
    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await restaurantRepository.createNewOrder(
        restaurantId: restaurantId, userId: userId);
  }
}
