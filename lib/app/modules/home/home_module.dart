import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/core/pages/connection_error_page.dart';
import 'package:gnu_delivery/app/modules/home/domain/usecases/get_restaurant_categories.dart';
import 'package:gnu_delivery/app/modules/home/domain/usecases/search_restaurant_by_name.dart';
import 'package:gnu_delivery/app/modules/home/external/datasource/firebase_datasource.dart';
import 'package:gnu_delivery/app/modules/home/external/drivers/flutter_connectivity_driver_impl.dart';
import 'package:gnu_delivery/app/modules/home/infra/repositories/restaurant_category_repository_impl.dart';
import 'package:gnu_delivery/app/modules/home/infra/repositories/restaurant_repository_impl.dart';
import 'package:gnu_delivery/app/modules/home/presenter/pages/user/user_controller.dart';

import 'domain/usecases/search_restaurant_by_category.dart';
import 'infra/services/connectivity_service_impl.dart';
import 'presenter/pages/home/home.dart';
import 'presenter/pages/more_searched/more_searched_controller.dart';

class HomeModule extends ChildModule {
  static List<Bind> export = [
    $RestaurantRepositoryImpl,
    $RestaurantCategoryRepositoryImpl,
    $FirebaseDataSourceImpl,
  ];

  @override
  List<Bind> get binds => [
        $SearchRestaurantByNameImpl,
        $GetCategoriesImpl,
        $SearchRestaurantByCategoryImpl,
        $MoreSearchedController,
        $UserController,
        $ConnectivityServiceImpl,
        $FlutterConnectivityDriver,
      ];
  @override
  List<ModularRouter> get routers => [
        ModularRouter("/home", child: (context, args) => Home()),
      ];
}
