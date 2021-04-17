import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_item_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/repositories/restaurant_repository.dart';
import 'package:gnu_delivery/app/modules/store/domain/services/conectivity_service.dart';

part 'create_new_order_item.g.dart';

abstract class CreateNewOrderItem {
  Future<Either<Failure, OrderItemInfo>> call({
    dynamic orderId,
    int productId,
    dynamic userId,
    int restaurantId,
    String name,
    int count,
    String type,
    Map<String, Map<String, dynamic>> aditionals,
    String observation,
  });
}

@Injectable(singleton: false)
class CreateNewOrderItemImpl implements CreateNewOrderItem {
  final RestaurantRepository restaurantRepository;
  final ConnectivityService connectivityService;

  CreateNewOrderItemImpl(this.restaurantRepository, this.connectivityService);

  @override
  Future<Either<Failure, OrderItemInfo>> call({
    dynamic orderId,
    int productId,
    dynamic userId,
    int restaurantId,
    String name,
    int count,
    String type,
    Map<String, Map<String, dynamic>> aditionals,
    String observation,
  }) async {
    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await restaurantRepository.createNewOrderItem(
      aditionals: aditionals,
      count: count,
      name: name,
      observation: observation,
      orderId: orderId,
      productId: productId,
      restaurantId: restaurantId,
      type: type,
      userId: userId,
    );
  }
}
