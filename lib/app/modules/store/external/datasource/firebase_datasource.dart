import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/infra/datasources/restaurant_datasource.dart';
import 'package:gnu_delivery/app/modules/store/infra/models/order_item_model.dart';
import 'package:gnu_delivery/app/modules/store/infra/models/order_model.dart';
import 'package:gnu_delivery/app/modules/store/infra/models/product_aditional_model.dart';
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

  @override
  Future<List<ProductAditionalModel>> getProductAditionals(
      {int restaurantId, int productId}) async {
    List<ProductAditionalModel> aditionalList = new List();

    QuerySnapshot documents = await Future.value(FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId.toString())
        .collection('products')
        .doc(productId.toString())
        .collection('aditionals')
        .get());
    print(documents.docs.first.data());
    documents.docs
        .map((DocumentSnapshot documentSnapshot) => documentSnapshot)
        .forEach((doc) {
      aditionalList.add(
        ProductAditionalModel(
          aditionalId: doc.get('aditional_id'),
          availability: doc.get('availability'),
          icon: doc.get('icon'),
          maxCount: (doc.get('maxCount') ?? 0).toDouble(),
          price: (doc.get('price') ?? 0).toDouble(),
          productId: doc.get('product_id'),
          restaurantId: doc.get('restaurant_id'),
          title: doc.get('title'),
        ),
      );
    });

    return aditionalList;
  }

  @override
  Future<OrderModel> createNewOrder({int restaurantId, dynamic userId}) async {
    String collection = "orders";
    String userOrderStatus = "A";

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId.toString())
        .collection(collection)
        .doc();
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentReference, {
        'order_id': documentReference.id,
        'user_order_status': userOrderStatus,
        'user_id': userId,
        'restaurant_id': restaurantId,
      });
    }).catchError((e) {
      return null;
    });

    return new OrderModel(
      orderId: documentReference.id,
      userId: userId,
      restaurantId: restaurantId,
      userOrderStatus: userOrderStatus,
    );
  }

  @override
  Future<OrderModel> getOpenedOrder({int restaurantId, userId}) async {
    QuerySnapshot existingOrder;

    try {
      existingOrder = await Future.value(
        FirebaseFirestore.instance
            .collection('restaurants')
            .doc(restaurantId.toString())
            .collection('orders')
            .where('user_order_status', isEqualTo: "A")
            .where('user_id', isEqualTo: userId)
            .get(),
      );
      return new OrderModel(
        orderId: existingOrder.docs.first.id,
        userId: userId,
        restaurantId: restaurantId,
        userOrderStatus: 'A',
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<OrderItemModel> createNewOrderItem({
    dynamic orderId,
    int productId,
    dynamic userId,
    int restaurantId,
    String name,
    int count,
    String type,
    Map<String, Map<String, dynamic>> aditionals,
    String observation,
  }) async {
    String collection = "items";

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId.toString())
        .collection('orders')
        .doc(orderId.toString())
        .collection(collection)
        .doc();

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentReference, {
        'order_id': orderId,
        'item_id': documentReference.id,
        'product_id': productId,
        'user_id': userId,
        'restaurant_id': restaurantId,
        'name': name,
        'count': count,
        'type': type,
        'aditionals': aditionals,
        'observation': observation,
      });
    }).catchError((e) {
      return null;
    });
    return new OrderItemModel(
      orderId: orderId,
      count: count,
      itemId: documentReference.id,
      productId: productId,
      restaurantId: restaurantId,
      type: type,
      userId: userId,
      aditionals: aditionals,
      name: name,
      observation: observation,
    );
  }

  @override
  Future<List<OrderItemModel>> getItemsOfCart(
      {int restaurantId, dynamic userId, dynamic orderId}) async {
    List<OrderItemModel> cartItemsList = new List();

    QuerySnapshot documents = await Future.value(FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId.toString())
        .collection('orders')
        .doc(orderId)
        .collection('items')
        .get());

    documents.docs
        .map((DocumentSnapshot documentSnapshot) => documentSnapshot)
        .forEach((doc) {
      //print(doc.get('aditionals'));
      Map<String, dynamic> teste = doc.get('aditionals');
      print(teste);
      cartItemsList.add(
        OrderItemModel(
          count: doc.get('count'),
          itemId: doc.get('item_id'),
          orderId: doc.get('order_id'),
          productId: doc.get('product_id'),
          restaurantId: doc.get('restaurant_id'),
          type: doc.get('type'),
          userId: doc.get('user_id'),
          aditionals: doc.get('aditionals'),
          name: doc.get('name'),
          observation: doc.get('observation'),
        ),
      );
    });

    return cartItemsList;
  }
}
