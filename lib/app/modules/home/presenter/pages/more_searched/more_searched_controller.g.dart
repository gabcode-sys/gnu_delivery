// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_searched_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MoreSearchedController = BindInject(
  (i) => MoreSearchedController(i<SearchRestaurantByName>(),
      i<SearchRestaurantByCategory>(), i<GetCategories>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoreSearchedController on ControllerBase, Store {
  final _$restaurantCategoryInfoAtom =
      Atom(name: 'ControllerBase.restaurantCategoryInfo');

  @override
  ObservableList<RestaurantCategoryInfo> get restaurantCategoryInfo {
    _$restaurantCategoryInfoAtom.reportRead();
    return super.restaurantCategoryInfo;
  }

  @override
  set restaurantCategoryInfo(ObservableList<RestaurantCategoryInfo> value) {
    _$restaurantCategoryInfoAtom
        .reportWrite(value, super.restaurantCategoryInfo, () {
      super.restaurantCategoryInfo = value;
    });
  }

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

  final _$selectedCategoryListIndexAtom =
      Atom(name: 'ControllerBase.selectedCategoryListIndex');

  @override
  int get selectedCategoryListIndex {
    _$selectedCategoryListIndexAtom.reportRead();
    return super.selectedCategoryListIndex;
  }

  @override
  set selectedCategoryListIndex(int value) {
    _$selectedCategoryListIndexAtom
        .reportWrite(value, super.selectedCategoryListIndex, () {
      super.selectedCategoryListIndex = value;
    });
  }

  final _$searchCategoriesAsyncAction =
      AsyncAction('ControllerBase.searchCategories');

  @override
  Future searchCategories() {
    return _$searchCategoriesAsyncAction.run(() => super.searchCategories());
  }

  final _$searchRestaurantbyNameAsyncAction =
      AsyncAction('ControllerBase.searchRestaurantbyName');

  @override
  Future searchRestaurantbyName(String name) {
    return _$searchRestaurantbyNameAsyncAction
        .run(() => super.searchRestaurantbyName(name));
  }

  final _$searchRestaurantbyCategoryAsyncAction =
      AsyncAction('ControllerBase.searchRestaurantbyCategory');

  @override
  Future searchRestaurantbyCategory(int categoryId) {
    return _$searchRestaurantbyCategoryAsyncAction
        .run(() => super.searchRestaurantbyCategory(categoryId));
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic setSelectedCategoryListIndex(int newIndex) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setSelectedCategoryListIndex');
    try {
      return super.setSelectedCategoryListIndex(newIndex);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
restaurantCategoryInfo: ${restaurantCategoryInfo},
restaurantInfo: ${restaurantInfo},
selectedCategoryListIndex: ${selectedCategoryListIndex}
    ''';
  }
}
