import 'package:equatable/equatable.dart';

class ProductAditional extends Equatable {
  final int aditionalId;
  final Map<String, dynamic> availability;
  final String icon;
  final double maxCount;
  final double price;
  final int productId;
  final int restaurantId;
  final String title;

  const ProductAditional({
    this.aditionalId,
    this.availability,
    this.icon,
    this.maxCount,
    this.price,
    this.productId,
    this.restaurantId,
    this.title,
  });

  @override
  List<Object> get props => [
        aditionalId,
        availability,
        icon,
        maxCount,
        price,
        productId,
        restaurantId,
        title,
      ];
}
