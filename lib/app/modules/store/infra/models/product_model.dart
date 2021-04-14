import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_info.dart';

class ProductModel extends Product implements ProductInfo {
  ProductModel({
    @required int productId,
    String name,
    String image,
    String description,
    double volume,
    String measurementUnit,
    double calorificValue,
    double price,
    Map<String, dynamic> type,
  }) : super(
          productId: productId,
          name: name,
          image: image,
          description: description,
          volume: volume,
          measurementUnit: measurementUnit,
          calorificValue: calorificValue,
          price: price,
          type: type,
        );

  Product toRestaurant() => this;
}
