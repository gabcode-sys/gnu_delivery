import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final dynamic orderId;
  final String userOrderStatus;
  final String restaurantOrderStatus;
  final dynamic userId;
  final int restaurantId;

  const Order({
    this.orderId,
    this.userOrderStatus,
    this.restaurantOrderStatus,
    this.userId,
    this.restaurantId,
  });

  @override
  List<Object> get props => [
        orderId,
        userOrderStatus,
        restaurantOrderStatus,
        userId,
        restaurantId,
      ];
}
