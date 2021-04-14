import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_category_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/repositories/restaurant_repository.dart';
import 'package:gnu_delivery/app/modules/store/domain/services/conectivity_service.dart';

part 'get_product_categories.g.dart';

abstract class GetProductCategories {
  Future<Either<Failure, List<ProductCategoryInfo>>> call(int restaurantId);
}

@Injectable(singleton: false)
class GetProductCategoriesImpl implements GetProductCategories {
  final RestaurantRepository restaurantRepository;
  final ConnectivityService connectivityService;

  GetProductCategoriesImpl(this.restaurantRepository, this.connectivityService);

  @override
  Future<Either<Failure, List<ProductCategoryInfo>>> call(
      int restaurantId) async {
    var result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await restaurantRepository.getProductCategories(restaurantId);
  }
}
