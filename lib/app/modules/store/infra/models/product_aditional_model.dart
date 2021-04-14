import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_aditional.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_aditional_info.dart';

class ProductAditionalModel extends ProductAditional
    implements ProductAditionalInfo {
  ProductAditionalModel({
    @required int aditionalId,
    Map<String, dynamic> availability,
    String icon,
    double maxCount,
    double price,
    int productId,
    int restaurantId,
    String title,
  }) : super(
          aditionalId: aditionalId,
          availability: availability,
          icon: icon,
          maxCount: maxCount,
          price: price,
          productId: productId,
          restaurantId: restaurantId,
          title: title,
        );

  ProductAditional toRestaurant() => this;
}
