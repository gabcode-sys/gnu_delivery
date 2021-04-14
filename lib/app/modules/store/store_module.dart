import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/search_product_by_id.dart';
import 'package:gnu_delivery/app/modules/store/domain/usecases/search_restaurant_by_id.dart';
import 'package:gnu_delivery/app/modules/store/external/datasource/firebase_datasource.dart';
import 'package:gnu_delivery/app/modules/store/external/drivers/flutter_connectivity_driver_impl.dart';
import 'package:gnu_delivery/app/modules/store/infra/repositories/restaurant_repository_impl.dart';
import 'package:gnu_delivery/app/modules/store/infra/services/connectivity_service_impl.dart';
import 'package:gnu_delivery/app/modules/store/presenter/pages/item_selector/item_selector_page.dart';
import 'package:gnu_delivery/app/modules/store/presenter/pages/store/store_page.dart';
import 'package:gnu_delivery/app/modules/store/presenter/pages/store/store_page_controller.dart';

import 'domain/usecases/get_product_categories.dart';
import 'domain/usecases/search_product_by_category.dart';
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
        $SearchRestaurantByIdImpl,
        $GetProductCategoriesImpl,
        $SearchProductByCategoryImpl,
        $SearchProductByIdImpl,
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
      ];
}