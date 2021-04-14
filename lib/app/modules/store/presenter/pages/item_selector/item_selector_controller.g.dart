// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_selector_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ItemSelectorController = BindInject(
  (i) => ItemSelectorController(i<SearchProductById>()),
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

  final _$searchProductByIdAsyncAction =
      AsyncAction('ControllerBase.searchProductById');

  @override
  Future searchProductById(int restaurantId, int productId) {
    return _$searchProductByIdAsyncAction
        .run(() => super.searchProductById(restaurantId, productId));
  }

  @override
  String toString() {
    return '''
productInfo: ${productInfo}
    ''';
  }
}
