import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/core/stores/auth_store.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_item_info.dart';
import 'package:gnu_delivery/app/modules/store/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/get_items_of_cart.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/get_opened_order.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

@Injectable()
class CartController = ControllerBase with _$CartController;

abstract class ControllerBase with Store {
  GetItemsOfCart getItemsOfCartUseCase;
  GetOpenedOrder getOpenedOrderUseCase;
  AuthStore authStore;

  ControllerBase(
    this.getItemsOfCartUseCase,
    this.getOpenedOrderUseCase,
    this.authStore,
  );

  @observable
  ObservableList<OrderItemInfo> cartItemsInfo =
      new ObservableList<OrderItemInfo>();

  @action
  Future<bool> getItemsOfCart(int restaurantId, dynamic orderId) async {
    var result = await getItemsOfCartUseCase(
      restaurantId: restaurantId,
      userId: authStore.user.phoneNumber,
      orderId: orderId,
    );

    return await result.fold((failure) {
      if (failure is ErrorNotFound) {
        print(failure.message);
        return false;
      } else if (failure is ConnectionError) {
        // Go to Offline Screen
        Modular.to.pushNamed('/connection_error');
        return false;
      } else {
        //Tratativa de Erros
        print(failure.message);
        return false;
      }
    }, (cartItemsInfoList) {
      this.cartItemsInfo = cartItemsInfoList.asObservable();
      return true;
    });
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
}
