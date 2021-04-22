// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CartController = BindInject(
  (i) =>
      CartController(i<GetItemsOfCart>(), i<GetOpenedOrder>(), i<AuthStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on ControllerBase, Store {
  final _$cartItemsInfoAtom = Atom(name: 'ControllerBase.cartItemsInfo');

  @override
  ObservableList<OrderItemInfo> get cartItemsInfo {
    _$cartItemsInfoAtom.reportRead();
    return super.cartItemsInfo;
  }

  @override
  set cartItemsInfo(ObservableList<OrderItemInfo> value) {
    _$cartItemsInfoAtom.reportWrite(value, super.cartItemsInfo, () {
      super.cartItemsInfo = value;
    });
  }

  final _$getItemsOfCartAsyncAction =
      AsyncAction('ControllerBase.getItemsOfCart');

  @override
  Future<bool> getItemsOfCart(int restaurantId, dynamic orderId) {
    return _$getItemsOfCartAsyncAction
        .run(() => super.getItemsOfCart(restaurantId, orderId));
  }

  final _$getOpenedOrderAsyncAction =
      AsyncAction('ControllerBase.getOpenedOrder');

  @override
  Future<OrderInfo> getOpenedOrder(int restaurantId) {
    return _$getOpenedOrderAsyncAction
        .run(() => super.getOpenedOrder(restaurantId));
  }

  @override
  String toString() {
    return '''
cartItemsInfo: ${cartItemsInfo}
    ''';
  }
}
