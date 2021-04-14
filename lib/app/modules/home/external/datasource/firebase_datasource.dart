import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/home/infra/datasources/restaurant_datasource.dart';
import 'package:gnu_delivery/app/modules/home/infra/models/restaurant_category_model.dart';
import 'package:gnu_delivery/app/modules/home/infra/models/restaurant_model.dart';

part 'firebase_datasource.g.dart';

@Injectable(singleton: false)
class FirebaseDataSourceImpl implements RestaurantDataSource {
  FirebaseDataSourceImpl();

  @override
  Future<List<RestaurantModel>> searchRestaurantbyName({String name}) async {
    List<RestaurantModel> restaurantList = new List();
    QuerySnapshot documents = await Future.value(FirebaseFirestore.instance
        .collection('restaurants')
        .where('name', isGreaterThanOrEqualTo: name)
        .where('name', isLessThan: name)
        .get());

    documents.docs
        .map((DocumentSnapshot documentSnapshot) => documentSnapshot)
        .forEach((doc) {
      restaurantList.add(
        RestaurantModel(
          restaurantId: doc.get('restaurant_id'),
          name: doc.get('name'),
          backgroundImage: doc.get('background_image'),
          listCategoryName: doc.get('categories_title'),
          startStandbyTime: doc.get('start_standby_time'),
          endStandbyTime: doc.get('end_standby_time'),
          priceAvaliation: doc.get('price_avaliation'),
        ),
      );
    });

    return restaurantList;
  }

  @override
  Future<List<RestaurantModel>> searchRestaurantbyCategory(
      {int category}) async {
    List<RestaurantModel> restaurantList = new List();

    QuerySnapshot documents = await Future.value(FirebaseFirestore.instance
        .collection('restaurants')
        .where('categories', arrayContains: category)
        .get());

    documents.docs
        .map((DocumentSnapshot documentSnapshot) => documentSnapshot)
        .forEach((doc) {
      restaurantList.add(
        RestaurantModel(
          restaurantId: doc.get('restaurant_id'),
          name: doc.get('name'),
          backgroundImage: doc.get('background_image'),
          listCategoryName: doc.get('categories_title'),
          startStandbyTime: doc.get('start_standby_time'),
          endStandbyTime: doc.get('end_standby_time'),
          priceAvaliation: doc.get('price_avaliation'),
        ),
      );
    });

    return restaurantList;
  }

  @override
  Future<List<RestaurantCategoryModel>> getRestaurantCategories() async {
    List<RestaurantCategoryModel> categoriesList = new List();
    QuerySnapshot documents = await Future.value(FirebaseFirestore.instance
        .collection('categories')
        .where(
          'active',
        )
        .orderBy('category_id')
        .get());
    documents.docs
        .map((DocumentSnapshot documentSnapshot) => documentSnapshot)
        .forEach(
          (doc) => categoriesList.add(
            RestaurantCategoryModel(
              categoryId: doc.get('category_id'),
              title: doc.get('title'),
              icon: doc.get('icon'),
            ),
          ),
        );

    return categoriesList;
  }
}
