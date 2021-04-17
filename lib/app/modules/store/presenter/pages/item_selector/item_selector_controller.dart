import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/core/stores/auth_store.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_item_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_aditional_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/create_new_order.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/create_new_order_item.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/get_opened_order.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/get_product_aditionals.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/search_product_by_id.dart';
import 'package:mobx/mobx.dart';

part 'item_selector_controller.g.dart';

@Injectable()
class ItemSelectorController = ControllerBase with _$ItemSelectorController;

abstract class ControllerBase with Store {
  TextEditingController textEditingController = new TextEditingController();
  final SearchProductById searchProductByIdUseCase;
  final GetProductAditionals getProductAditionalsUseCase;
  final CreateNewOrder createNewOrderUseCase;
  final GetOpenedOrder getOpenedOrderUseCase;
  final CreateNewOrderItem createNewOrderItemUseCase;
  final AuthStore authStore;
  ControllerBase(
    this.searchProductByIdUseCase,
    this.getProductAditionalsUseCase,
    this.createNewOrderUseCase,
    this.getOpenedOrderUseCase,
    this.createNewOrderItemUseCase,
    this.authStore,
  );

  @observable
  String orderObservation = '';

  @observable
  ObservableList<ProductInfo> productInfo = new ObservableList<ProductInfo>();

  @observable
  ObservableList<ProductAditionalInfo> productAditionalInfo =
      new ObservableList<ProductAditionalInfo>();

  @observable
  int itemCount = 1;

  @action
  setOrderObservation() {
    this.orderObservation = textEditingController.text;
  }

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

  @action
  getProductAditionals(int restaurantId, int productId) async {
    var result = await getProductAditionalsUseCase(restaurantId, productId);

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
    }, (productAditionalList) {
      this.productAditionalInfo = productAditionalList.asObservable();
    });

    return true;
  }

  @action
  Future<OrderInfo> getOpenedOrder(int restaurantId) async {
    var result =
        await getOpenedOrderUseCase(restaurantId, authStore.user.phoneNumber);
    return result.fold((failure) {
      if (failure is ErrorNotFound) {
        // Error
        return null;
      } else if (failure is ConnectionError) {
        // Go to Offline Screen
        Modular.to.pushNamed('/connection_error');
        return null;
      } else {
        // Another error
        return null;
      }
    }, (orderInfo) {
      // Sucessful, do anything
      return orderInfo;
    });
  }

  @action
  Future<OrderInfo> createNewOrder(int restaurantId) async {
    var result =
        await createNewOrderUseCase(restaurantId, authStore.user.phoneNumber);
    return result.fold((failure) {
      if (failure is ErrorNotFound) {
        // Error
        return null;
      } else if (failure is ConnectionError) {
        // Go to Offline Screen
        Modular.to.pushNamed('/connection_error');
        return null;
      } else {
        return null;
      }
    }, (OrderInfo orderInfo) {
      // Sucessful, do anything
      return orderInfo;
    });
  }

  @action
  Future<OrderItemInfo> createNewOrderItem({
    dynamic orderId,
    dynamic itemId,
    int productId,
    int restaurantId,
    String name,
    int count,
    String type,
    Map<String, Map<String, dynamic>> aditionals,
    String observation,
  }) async {
    var result = await createNewOrderItemUseCase(
      orderId: orderId,
      productId: productId,
      userId: authStore.user.phoneNumber,
      restaurantId: restaurantId,
      name: name,
      count: count,
      type: type,
      aditionals: aditionals,
      observation: observation,
    );
    return result.fold((failure) {
      if (failure is ErrorNotFound) {
        // Error
        return null;
      } else if (failure is ConnectionError) {
        // Go to Offline Screen
        Modular.to.pushNamed('/connection_error');
        return null;
      } else {
        return null;
      }
    }, (OrderItemInfo orderItemInfo) {
      // Sucessful, do anything
      return orderItemInfo;
    });
  }
}
