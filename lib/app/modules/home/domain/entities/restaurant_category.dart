import 'package:equatable/equatable.dart';

class RestaurantCategory extends Equatable {
  final int categoryId;
  final String title;
  final String icon;

  const RestaurantCategory({this.categoryId, this.title, this.icon});

  @override
  List<Object> get props => [categoryId, title, icon];
}
