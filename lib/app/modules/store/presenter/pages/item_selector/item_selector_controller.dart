import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/search_product_by_id.dart';
import 'package:mobx/mobx.dart';

part 'item_selector_controller.g.dart';

@Injectable()
class ItemSelectorController = ControllerBase with _$ItemSelectorController;

abstract class ControllerBase with Store {
  final SearchProductById searchProductByIdUseCase;
  ControllerBase(this.searchProductByIdUseCase);

  @observable
  ObservableList<ProductInfo> productInfo = new ObservableList<ProductInfo>();

  @observable
  int itemCount = 1;

  @action
  searchProductById(int restaurantId, int productId) async {
    var result = await searchProductByIdUseCase(restaurantId, productId);

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
