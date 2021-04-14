import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_category.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_category_info.dart';

class ProductCategoryModel extends ProductCategory
    implements ProductCategoryInfo {
  ProductCategoryModel({
    @required int productCategoryId,
    int restaurantId,
    String title,
    String icon,
  }) : super(
            productCategoryId: productCategoryId,
            restaurantId: restaurantId,
            title: title,
            icon: icon);

  ProductCategory toRestaurant() => this;
}
