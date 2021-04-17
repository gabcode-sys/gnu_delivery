// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_selector_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ItemSelectorController = BindInject(
  (i) => ItemSelectorController(
      i<SearchProductById>(),
      i<GetProductAditionals>(),
      i<CreateNewOrder>(),
      i<GetOpenedOrder>(),
      i<CreateNewOrderItem>(),
      i<AuthStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemSelectorController on ControllerBase, Store {
  final _$orderObservationAtom = Atom(name: 'ControllerBase.orderObservation');

  @override
  String get orderObservation {
    _$orderObservationAtom.reportRead();
    return super.orderObservation;
  }

  @override
  set orderObservation(String value) {
    _$orderObservationAtom.reportWrite(value, super.orderObservation, () {
      super.orderObservation = value;
    });
  }

  final _$productInfoAtom = Atom(name: 'ControllerBase.productInfo');

  @override
  ObservableList<ProductInfo> get productInfo {
    _$productInfoAtom.reportRead();
    return super.productInfo;
  }

  @override
  set productInfo(ObservableList<ProductInfo> value) {
    _$productInfoAtom.reportWrite(value, super.productInfo, () {
      super.productInfo = value;
    });
  }

  final _$productAditionalInfoAtom =
      Atom(name: 'ControllerBase.productAditionalInfo');

  @override
  ObservableList<ProductAditionalInfo> get productAditionalInfo {
    _$productAditionalInfoAtom.reportRead();
    return super.productAditionalInfo;
  }

  @override
  set productAditionalInfo(ObservableList<ProductAditionalInfo> value) {
    _$productAditionalInfoAtom.reportWrite(value, super.productAditionalInfo,
        () {
      super.productAditionalInfo = value;
    });
  }

  final _$itemCountAtom = Atom(name: 'ControllerBase.itemCount');

  @override
  int get itemCount {
    _$itemCountAtom.reportRead();
    return super.itemCount;
  }

  @override
  set itemCount(int value) {
    _$itemCountAtom.reportWrite(value, super.itemCount, () {
      super.itemCount = value;
    });
  }

  final _$searchProductByIdAsyncAction =
      AsyncAction('ControllerBase.searchProductById');

  @override
  Future searchProductById(int restaurantId, int productId) {
    return _$searchProductByIdAsyncAction
        .run(() => super.searchProductById(restaurantId, productId));
  }

  final _$getProductAditionalsAsyncAction =
      AsyncAction('ControllerBase.getProductAditionals');

  @override
  Future getProductAditionals(int restaurantId, int productId) {
    return _$getProductAditionalsAsyncAction
        .run(() => super.getProductAditionals(restaurantId, productId));
  }

  final _$getOpenedOrderAsyncAction =
      AsyncAction('ControllerBase.getOpenedOrder');

  @override
  Future<OrderInfo> getOpenedOrder(int restaurantId) {
    return _$getOpenedOrderAsyncAction
        .run(() => super.getOpenedOrder(restaurantId));
  }

  final _$createNewOrderAsyncAction =
      AsyncAction('ControllerBase.createNewOrder');

  @override
  Future<OrderInfo> createNewOrder(int restaurantId) {
    return _$createNewOrderAsyncAction
        .run(() => super.createNewOrder(restaurantId));
  }

  final _$createNewOrderItemAsyncAction =
      AsyncAction('ControllerBase.createNewOrderItem');

  @override
  Future<OrderItemInfo> createNewOrderItem(
      {dynamic orderId,
      dynamic itemId,
      int productId,
      int restaurantId,
      String name,
      int count,
      String type,
      Map<String, Map<String, dynamic>> aditionals,
      String observation}) {
    return _$createNewOrderItemAsyncAction.run(() => super.createNewOrderItem(
        orderId: orderId,
        itemId: itemId,
        productId: productId,
        restaurantId: restaurantId,
        name: name,
        count: count,
        type: type,
        aditionals: aditionals,
        observation: observation));
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic setOrderObservation() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setOrderObservation');
    try {
      return super.setOrderObservation();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderObservation: ${orderObservation},
productInfo: ${productInfo},
productAditionalInfo: ${productAditionalInfo},
itemCount: ${itemCount}
    ''';
  }
}
