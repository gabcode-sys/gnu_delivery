import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/create_new_order_item.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/get_opened_order.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/get_product_aditionals.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/search_product_by_id.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/search_restaurant_by_id.dart';
import 'package:gnu_delivery/app/modules/store/external/datasource/firebase_datasource.dart';
import 'package:gnu_delivery/app/modules/store/external/drivers/flutter_connectivity_driver_impl.dart';
import 'package:gnu_delivery/app/modules/store/infra/repositories/restaurant_repository_impl.dart';
import 'package:gnu_delivery/app/modules/store/infra/services/connectivity_service_impl.dart';
import 'package:gnu_delivery/app/modules/store/presenter/pages/cart/cart_controller.dart';
import 'package:gnu_delivery/app/modules/store/presenter/pages/item_selector/item_selector_page.dart';
import 'package:gnu_delivery/app/modules/store/presenter/pages/store/store_page.dart';
import 'package:gnu_delivery/app/modules/store/presenter/pages/store/store_page_controller.dart';

import 'domain/usecases/create_new_order.dart';
import 'domain/usecases/get_product_categories.dart';
import 'domain/usecases/search_product_by_category.dart';
import 'presenter/pages/cart/cart_page.dart';
import 'presenter/pages/item_selector/item_selector_controller.dart';

class StoreModule extends ChildModule {
  static List<Bind> export = [
    $RestaurantRepositoryImpl,
    $FirebaseDataSourceImpl,
  ];

  @override
  List<Bind> get binds => [
        $StorePageController,
        $ItemSelectorController,
        $CartController,
        $SearchRestaurantByIdImpl,
        $GetProductCategoriesImpl,
        $SearchProductByCategoryImpl,
        $SearchProductByIdImpl,
        $GetProductAditionalsImpl,
        $CreateNewOrderImpl,
        $GetOpenedOrderImpl,
        $CreateNewOrderItemImpl,
        $ConnectivityServiceImpl,
        $FlutterConnectivityDriver,
      ];
  @override
  List<ModularRouter> get routers => [
        ModularRouter("/store/:restaurantId",
            child: (context, args) => StorePage()),
        ModularRouter(
          "/item_selector",
          child: (context, args) => ItemSelector(productParams: args.data),
        ),
        ModularRouter(
          "/cart",
          child: (context, args) => Cart(),
        ),
      ];
}
