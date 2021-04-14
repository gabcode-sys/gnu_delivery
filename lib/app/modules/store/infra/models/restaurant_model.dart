import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/restaurant.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/restaurant_info.dart';

class RestaurantModel extends Restaurant implements RestaurantInfo {
  RestaurantModel({
    @required int restaurantId,
    String name,
    String backgroundImage,
    List listCategoryName,
    int startStandbyTime,
    int endStandbyTime,
    int priceAvaliation,
  }) : super(
          restaurantId: restaurantId,
          name: name,
          backgroundImage: backgroundImage,
          listCategoryName: listCategoryName,
          startStandbyTime: startStandbyTime,
          endStandbyTime: endStandbyTime,
          priceAvaliation: priceAvaliation,
        );

  Restaurant toRestaurant() => this;
}
