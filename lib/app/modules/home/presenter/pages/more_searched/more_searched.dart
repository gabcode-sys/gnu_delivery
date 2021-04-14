import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/home/presenter/pages/more_searched/more_searched_controller.dart';
import 'package:gnu_delivery/app/modules/home/presenter/widgets/restaurant_category.dart';
import 'package:gnu_delivery/app/modules/home/presenter/widgets/store.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MoreSearched extends StatefulWidget {
  @override
  _MoreSearchedState createState() => _MoreSearchedState();
}

class _MoreSearchedState
    extends ModularState<MoreSearched, MoreSearchedController> {
  int selectedIndex = 0;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await controller.searchCategories();
    await controller
        .searchRestaurantbyCategory(controller.selectedCategoryListIndex);

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    await Future.delayed(Duration(seconds: 3));
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    controller.searchRestaurantbyCategory(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.searchCategories();
    RestaurantCategory _category = RestaurantCategory();
    Store _store = Store(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.tune_rounded),
          color: UIThemeColors.blackTheme,
          onPressed: () {},
        ),
        centerTitle: true,
        title: Container(
          width: 300,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: TextField(
            style: TextStyle(
              fontSize: 12.0,
              color: UIThemeColors.blackTheme,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            color: UIThemeColors.blackTheme,
            onPressed: () {},
          ),
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(
          complete: SizedBox(),
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SafeArea(
          minimum: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mais \nProcurados',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: UIThemeColors.blackTheme,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Observer(builder: (_) {
                          return ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.restaurantCategoryInfo.length,
                            itemBuilder: (BuildContext context, int index) =>
                                _category.category(
                              colorIndex: selectedIndex == index,
                              categoryText: controller
                                  .restaurantCategoryInfo[index].title,
                              image: Image.network(controller
                                  .restaurantCategoryInfo[index].icon),
                              onPressed: () {
                                controller.searchRestaurantbyCategory(controller
                                    .restaurantCategoryInfo[index].categoryId);
                                controller.setSelectedCategoryListIndex(controller
                                    .restaurantCategoryInfo[index]
                                    .categoryId); // Usado para manter o índice selecionado no reload
                                setState(() {});
                                selectedIndex = index;
                              },
                              onSelectedColor: UIThemeColors.orangeTheme,
                              notSelectedColor: UIThemeColors.whiteTheme,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Observer(builder: (_) {
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: controller.restaurantInfo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _store.store(
                        image: controller.restaurantInfo[index].backgroundImage,
                        minWaitingTime:
                            controller.restaurantInfo[index].startStandbyTime,
                        maxWaitingTime:
                            controller.restaurantInfo[index].endStandbyTime,
                        avaliation: 0.0,
                        priceNivel:
                            controller.restaurantInfo[index].priceAvaliation,
                        categories:
                            controller.restaurantInfo[index].listCategoryName,
                        storeTitle: controller.restaurantInfo[index].name,
                        onPressed: () {
                          Modular.to.pushNamed(
                              "/store_module/store/${controller.restaurantInfo[index].restaurantId}");
                          // Go to Product List
                        },
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
