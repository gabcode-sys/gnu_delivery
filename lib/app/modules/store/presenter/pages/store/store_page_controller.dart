import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_category_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/restaurant_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/get_product_categories.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/search_product_by_category.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/search_restaurant_by_id.dart';
import 'package:mobx/mobx.dart';

part 'store_page_controller.g.dart';

@Injectable()
class StorePageController = ControllerBase with _$StorePageController;

abstract class ControllerBase with Store {
  final String restaurantId;
  final SearchRestaurantById searchRestaurantByIdUseCase;
  final GetProductCategories getProductCategoriesUseCase;
  final SearchProductByCategory searchProductByCategoryUseCase;
  ControllerBase(@Param this.restaurantId, this.searchRestaurantByIdUseCase,
      this.getProductCategoriesUseCase, this.searchProductByCategoryUseCase);

  @observable
  ObservableList<RestaurantInfo> restaurantInfo =
      new ObservableList<RestaurantInfo>();

  @observable
  ObservableList<ProductCategoryInfo> productCategoriesInfo =
      new ObservableList<ProductCategoryInfo>();

  @observable
  ObservableList<ProductInfo> productInfo = new ObservableList<ProductInfo>();

  @action
  searchRestaurantById(int restaurantId) async {
    var result = await searchRestaurantByIdUseCase(restaurantId);

    result.fold((failure) {
      if (failure is ErrorNotFound) {
        print(failure.message);
      } else if (failure is ConnectionError) {
        // Go to Offline Screen
        Modular.to.pushNamed('/connection_error');
      } else {
        //Tratativa de Erros
        print(failure.message);
      }
    }, (restaurantList) {
      this.restaurantInfo = restaurantList.asObservable();
    });
    return true;
  }

  @action
  getProductCategories() async {
    var result =
        await getProductCategoriesUseCase(int.parse(this.restaurantId));

    result.fold((failure) {
      if (failure is ErrorNotFound) {
        print(failure.message);
      } else if (failure is ConnectionError) {
        // Go to Offline Screen
        Modular.to.pushNamed('/connection_error');
      } else {
        //Tratativa de Erros
        print(failure.message);
      }
    }, (produtCategoriesList) {
      this.productCategoriesInfo = produtCategoriesList.asObservable();
    });
    return true;
  }

  @action
  searchProductByCategory(int productCategory) async {
    var result = await searchProductByCategoryUseCase(
        productCategory, int.parse(this.restaurantId));

    result.fold((failure) {
      if (failure is ErrorNotFound) {
        print(failure.message);
      } else if (failure is ConnectionError) {
        // Go to Offline Screen
        Modular.to.pushNamed('/connection_error');
      } else {
        //Tratativa de Erros
        print(failure.message);
      }
    }, (productList) {
      this.productInfo = productList.asObservable();
    });

    return true;
  }
}
