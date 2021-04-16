import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_info.dart';

class OrderModel extends Order implements OrderInfo {
  OrderModel({
    @required dynamic orderId,
    @required dynamic userId,
    @required int restaurantId,
    String userOrderStatus,
    String restaurantOrderStatus,
  }) : super(
          orderId: orderId,
          restaurantId: restaurantId,
          restaurantOrderStatus: restaurantOrderStatus,
          userId: userId,
          userOrderStatus: userOrderStatus,
        );

  Order toOrder() => this;
}
