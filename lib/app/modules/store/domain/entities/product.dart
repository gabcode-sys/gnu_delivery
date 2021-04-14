import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int productId;
  final String name;
  final String image;
  final String description;
  final double volume;
  final String measurementUnit;
  final double calorificValue;
  final double price;
  final Map<String, dynamic> type;

  const Product({
    this.productId,
    this.name,
    this.image,
    this.description,
    this.volume,
    this.measurementUnit,
    this.calorificValue,
    this.price,
    this.type,
  });

  @override
  List<Object> get props => [
        productId,
        name,
        image,
        description,
        volume,
        measurementUnit,
        calorificValue,
        price,
        type,
      ];
}
