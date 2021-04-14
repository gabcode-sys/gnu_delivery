import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final int restaurantId;
  final String name;
  final String backgroundImage;
  final List listCategoryName;
  final int startStandbyTime;
  final int endStandbyTime;
  final int priceAvaliation;

  const Restaurant({
    this.restaurantId,
    this.name,
    this.backgroundImage,
    this.listCategoryName,
    this.startStandbyTime,
    this.endStandbyTime,
    this.priceAvaliation,
  });

  @override
  List<Object> get props => [
        restaurantId,
        name,
        backgroundImage,
        startStandbyTime,
        endStandbyTime,
        priceAvaliation,
      ];
}
