import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final dynamic orderId;
  final dynamic itemId;
  final int productId;
  final dynamic userId;
  final int restaurantId;
  final String name;
  final int count;
  final String type;
  final Map<String, Map<String, dynamic>> aditionals;
  final String observation;

  const OrderItem({
    this.orderId,
    this.itemId,
    this.productId,
    this.userId,
    this.restaurantId,
    this.name,
    this.count,
    this.type,
    this.aditionals,
    this.observation,
  });

  @override
  List<Object> get props => [
        orderId,
        itemId,
        productId,
        userId,
        restaurantId,
        name,
        count,
        type,
        aditionals,
        observation,
      ];
}
