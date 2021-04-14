import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_category_info.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_info.dart';
import 'package:gnu_delivery/app/modules/home/domain/entities/restaurant_search.dart';
import 'package:gnu_delivery/app/modules/home/domain/errors/errors.dart';
import 'package:gnu_delivery/app/modules/home/domain/usecases/get_restaurant_categories.dart';
import 'package:gnu_delivery/app/modules/home/domain/usecases/search_restaurant_by_category.dart';
import 'package:gnu_delivery/app/modules/home/domain/usecases/search_restaurant_by_name.dart';
import 'package:mobx/mobx.dart';

part 'more_searched_controller.g.dart';

@Injectable()
class MoreSearchedController = ControllerBase with _$MoreSearchedController;

abstract class ControllerBase with Store {
  final SearchRestaurantByName searchRestaurantByNameUseCase;
  final SearchRestaurantByCategory searchRestaurantByCategoryUseCase;
  final GetCategories getCategoriesUseCase;
  ControllerBase(
    this.searchRestaurantByNameUseCase,
    this.searchRestaurantByCategoryUseCase,
    this.getCategoriesUseCase,
  );

  @observable
  ObservableList<RestaurantCategoryInfo> restaurantCategoryInfo =
      new ObservableList<RestaurantCategoryInfo>();

  @observable
  ObservableList<RestaurantInfo> restaurantInfo =
      new ObservableList<RestaurantInfo>();

  @observable
  int selectedCategoryListIndex = 1;

  @action
  setSelectedCategoryListIndex(int newIndex) {
    this.selectedCategoryListIndex = newIndex;
  }

  @action
  searchCategories() async {
    var result = await getCategoriesUseCase();

    result.fold(
      (failure) {
        if (failure is ErrorNotFound) {
          print('Mensagem de erro');
          print(failure.message);
        } else if (failure is ConnectionError) {
          // Go to Offline Screen

        } else {
          //Erro Generico
          print('Mensagem de erro');
          print(failure.message);
        }
      },
      (restaurantCategoriesList) {
        this.restaurantCategoryInfo = restaurantCategoriesList.asObservable();
      },
    );
  }

  @action
  searchRestaurantbyName(String name) async {
    var result = await searchRestaurantByCategoryUseCase(
        RestaurantSearch.byName(name: name));

    result.fold((failure) {
      if (failure is ErrorNotFound) {
        print('Mensagem de erro');
        print(failure.message);
      } else if (failure is ConnectionError) {
        // Go to Offline Screen
      } else {
        //Erro Generico
        print('Mensagem de erro');
        print(failure.message);
      }
    }, (restaurantList) {
      this.restaurantInfo = restaurantList.asObservable();
    });
  }

  @action
  searchRestaurantbyCategory(int categoryId) async {
    var result = await searchRestaurantByCategoryUseCase(
        RestaurantSearch.byCategory(category: categoryId));

    result.fold((failure) {
      if (failure is ErrorNotFound) {
        print(failure.message);
      } else if (failure is ConnectionError) {
        // Go to Offline Screen
        Modular.to.pushNamed('/connection_error');
      } else {
        //Tratativa de Erros
        print(failure.message);
      }
    }, (restaurantList) {
      this.restaurantInfo = restaurantList.asObservable();
    });
  }
}
