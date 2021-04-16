// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_selector_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ItemSelectorController = BindInject(
  (i) => ItemSelectorController(i<SearchProductById>(),
      i<GetProductAditionals>(), i<CreateNewOrder>(), i<AuthStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemSelectorController on ControllerBase, Store {
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

  final _$createNewOrderAsyncAction =
      AsyncAction('ControllerBase.createNewOrder');

  @override
  Future createNewOrder(int restaurantId) {
    return _$createNewOrderAsyncAction
        .run(() => super.createNewOrder(restaurantId));
  }

  final _$createNewOrderItemAsyncAction =
      AsyncAction('ControllerBase.createNewOrderItem');

  @override
  Future createNewOrderItem() {
    return _$createNewOrderItemAsyncAction
        .run(() => super.createNewOrderItem());
  }

  @override
  String toString() {
    return '''
productInfo: ${productInfo},
productAditionalInfo: ${productAditionalInfo},
itemCount: ${itemCount}
    ''';
  }
}
