import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_category.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_category_info.dart';

class RestaurantCategoryModel extends RestaurantCategory
    implements RestaurantCategoryInfo {
  RestaurantCategoryModel({@required int categoryId, String title, String icon})
      : super(
          categoryId: categoryId,
          title: title,
          icon: icon,
        );

  RestaurantCategory toRestaurantCategory() => this;
}
