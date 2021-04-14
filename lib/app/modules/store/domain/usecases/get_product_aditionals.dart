import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_aditional_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/repositories/restaurant_repository.dart';
import 'package:gnu_delivery/app/modules/store/domain/services/conectivity_service.dart';

part 'get_product_aditionals.g.dart';

abstract class GetProductAditionals {
  Future<Either<Failure, List<ProductAditionalInfo>>> call(
      int restaurantId, int productId);
}

@Injectable(singleton: false)
class GetProductAditionalsImpl implements GetProductAditionals {
  final RestaurantRepository restaurantRepository;
  final ConnectivityService connectivityService;

  GetProductAditionalsImpl(this.restaurantRepository, this.connectivityService);

  @override
  Future<Either<Failure, List<ProductAditionalInfo>>> call(
      int restaurantId, int productId) async {
    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await restaurantRepository.getProductAditionals(
        restaurantId: restaurantId, productId: productId);
  }
}
