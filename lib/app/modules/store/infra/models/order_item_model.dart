import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_item.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_item_info.dart';

class OrderItemModel extends OrderItem implements OrderItemInfo {
  OrderItemModel({
    @required dynamic orderId,
    @required itemId,
    @required int productId,
    @required dynamic userId,
    @required int restaurantId,
    String name,
    @required int count,
    @required String type,
    Map<String, Map<String, dynamic>> aditionals,
    String observation,
  }) : super(
          orderId: orderId,
          itemId: itemId,
          productId: productId,
          aditionals: aditionals,
          count: count,
          name: name,
          observation: observation,
          restaurantId: restaurantId,
          type: type,
          userId: userId,
        );

  OrderItem toOrderItem() => this;
}
