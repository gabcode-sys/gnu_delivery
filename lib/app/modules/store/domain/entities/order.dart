import 'package:equatable/equatable.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/product_info.dart';

class Order extends Equatable {
  final int orderId;
  final Map<String, dynamic> userOrderStatus;
  final Map<String, dynamic> restaurantOrderStatus;

  const Order({
    this.orderId,
    this.userOrderStatus,
    this.restaurantOrderStatus,
  });

  @override
  List<Object> get props => [
        orderId,
        userOrderStatus,
        restaurantOrderStatus,
      ];
}
