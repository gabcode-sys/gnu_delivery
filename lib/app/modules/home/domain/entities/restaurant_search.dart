import 'package:flutter/material.dart';

class RestaurantSearch {
  final String name;
  final int category;

  RestaurantSearch._({this.name, this.category});

  bool get isValidSearch => name != null && name.isNotEmpty;

  factory RestaurantSearch.byCategory({@required int category}) {
    return RestaurantSearch._(
      category: category,
    );
  }

  factory RestaurantSearch.byName({@required String name}) {
    return RestaurantSearch._(
      name: name,
    );
  }
}
