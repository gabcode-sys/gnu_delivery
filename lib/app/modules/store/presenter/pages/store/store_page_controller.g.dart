// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_page_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $StorePageController = BindInject(
  (i) => StorePageController(
      i.args.params['restaurantId'],
      i<SearchRestaurantById>(),
      i<GetProductCategories>(),
      i<SearchProductByCategory>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StorePageController on ControllerBase, Store {
  final _$restaurantInfoAtom = Atom(name: 'ControllerBase.restaurantInfo');

  @override
  ObservableList<RestaurantInfo> get restaurantInfo {
    _$restaurantInfoAtom.reportRead();
    return super.restaurantInfo;
  }

  @override
  set restaurantInfo(ObservableList<RestaurantInfo> value) {
    _$restaurantInfoAtom.reportWrite(value, super.restaurantInfo, () {
      super.restaurantInfo = value;
    });
  }

  final _$productCategoriesInfoAtom =
      Atom(name: 'ControllerBase.productCategoriesInfo');

  @override
  ObservableList<ProductCategoryInfo> get productCategoriesInfo {
    _$productCategoriesInfoAtom.reportRead();
    return super.productCategoriesInfo;
  }

  @override
  set productCategoriesInfo(ObservableList<ProductCategoryInfo> value) {
    _$productCategoriesInfoAtom.reportWrite(value, super.productCategoriesInfo,
        () {
      super.productCategoriesInfo = value;
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

  final _$searchRestaurantByIdAsyncAction =
      AsyncAction('ControllerBase.searchRestaurantById');

  @override
  Future searchRestaurantById(int restaurantId) {
    return _$searchRestaurantByIdAsyncAction
        .run(() => super.searchRestaurantById(restaurantId));
  }

  final _$getProductCategoriesAsyncAction =
      AsyncAction('ControllerBase.getProductCategories');

  @override
  Future getProductCategories() {
    return _$getProductCategoriesAsyncAction
        .run(() => super.getProductCategories());
  }

  final _$searchProductByCategoryAsyncAction =
      AsyncAction('ControllerBase.searchProductByCategory');

  @override
  Future searchProductByCategory(int productCategory) {
    return _$searchProductByCategoryAsyncAction
        .run(() => super.searchProductByCategory(productCategory));
  }

  @override
  String toString() {
    return '''
restaurantInfo: ${restaurantInfo},
productCategoriesInfo: ${productCategoriesInfo},
productInfo: ${productInfo}
    ''';
  }
}
