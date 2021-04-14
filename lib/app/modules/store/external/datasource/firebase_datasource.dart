import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/infra/datasources/restaurant_datasource.dart';
import 'package:gnu_delivery/app/modules/store/infra/models/product_category_model.dart';
import 'package:gnu_delivery/app/modules/store/infra/models/product_model.dart';
import 'package:gnu_delivery/app/modules/store/infra/models/restaurant_model.dart';

part 'firebase_datasource.g.dart';

@Injectable(singleton: false)
class FirebaseDataSourceImpl implements RestaurantDataSource {
  FirebaseDataSourceImpl();

  @override
  Future<List<RestaurantModel>> searchRestaurantbyId({int restaurantId}) async {
    List<RestaurantModel> restaurantList = new List();

    QuerySnapshot documents = await Future.value(FirebaseFirestore.instance
        .collection('restaurants')
        .where('restaurant_id', isEqualTo: restaurantId)
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
  Future<List<ProductCategoryModel>> getProductCategories(
      int restaurantId) async {
    List<ProductCategoryModel> categoriesList = new List();

    QuerySnapshot documents = await Future.value(FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId.toString())
        .collection('product_categories')
        .get());
    print(documents);
    documents.docs
        .map((DocumentSnapshot documentSnapshot) => documentSnapshot)
        .forEach((doc) {
      categoriesList.add(
        ProductCategoryModel(
          productCategoryId: doc.get('product_category_id'),
          restaurantId: doc.get('restaurant_id'),
          title: doc.get('title'),
          icon: doc.get('icon'),
        ),
      );
    });

    return categoriesList;
  }

  @override
  Future<List<ProductModel>> searchProductbyCategory(
      int productCategory, int restaurantId) async {
    List<ProductModel> productList = new List();

    QuerySnapshot documents = await Future.value(FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId.toString())
        .collection('products')
        .where('product_category', arrayContains: productCategory)
        .get());

    documents.docs
        .map((DocumentSnapshot documentSnapshot) => documentSnapshot)
        .forEach((doc) {
      
      productList.add(
        ProductModel(
          productId: doc.get('product_id'),
          name: doc.get('name'),
          image: doc.get('image'),
          description: doc.get('description'),
          volume: (doc.get('volume') ?? 0).toDouble(),
          calorificValue: (doc.get('calorific_value') ?? 0).toDouble(),
          measurementUnit: doc.get('measurement_unit'),
          price: doc.get('price'),
        ),
      );
    });

    return productList;
  }

  @override
  Future<List<ProductModel>> searchProductbyId(
      int productId, int restaurantId) async {
    List<ProductModel> productList = new List();

    QuerySnapshot documents = await Future.value(FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId.toString())
        .collection('products')
        .where('product_id', isEqualTo: productId)
        .get());

    documents.docs
        .map((DocumentSnapshot documentSnapshot) => documentSnapshot)
        .forEach((doc) {
      productList.add(
        ProductModel(
          productId: doc.get('product_id'),
          name: doc.get('name'),
          image: doc.get('image'),
          description: doc.get('description'),
          volume: (doc.get('volume') ?? 0).toDouble(),
          calorificValue: (doc.get('calorific_value') ?? 0).toDouble(),
          measurementUnit: doc.get('measurement_unit'),
          price: doc.get('price'),
          type: doc.get('type'),
        ),
      );
    });

    return productList;
  }
}
