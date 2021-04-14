import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/repositories/restaurant_repository.dart';
import 'package:gnu_delivery/app/modules/store/domain/services/conectivity_service.dart';

part 'search_product_by_id.g.dart';

abstract class SearchProductById {
  Future<Either<Failure, List<ProductInfo>>> call(
      int productId, int restaurantId);
}

@Injectable(singleton: false)
class SearchProductByIdImpl implements SearchProductById {
  final RestaurantRepository restaurantRepository;
  final ConnectivityService connectivityService;

  SearchProductByIdImpl(this.restaurantRepository, this.connectivityService);

  @override
  Future<Either<Failure, List<ProductInfo>>> call(
      int productId, int restaurantId) async {
    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await restaurantRepository.searchProductbyId(
        productId: productId, restaurantId: restaurantId);
  }
}
