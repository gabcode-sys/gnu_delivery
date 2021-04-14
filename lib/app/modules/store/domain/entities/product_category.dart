import 'package:equatable/equatable.dart';

class ProductCategory extends Equatable {
  final int restaurantId;
  final int productCategoryId;
  final String title;
  final String icon;

  const ProductCategory({
    this.restaurantId,
    this.productCategoryId,
    this.title,
    this.icon,
  });

  @override
  List<Object> get props => [
        restaurantId,
        productCategoryId,
        title,
        icon,
      ];
}
