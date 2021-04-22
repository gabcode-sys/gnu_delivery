import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gnu_delivery/app/modules/store/presenter/widgets/item.dart';
import 'package:gnu_delivery/app/modules/store/presenter/widgets/caroussel_selector.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';

import 'store_page_controller.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends ModularState<StorePage, StorePageController> {
  int selectedIndex = 0;
  List<int> params = [1, 1];
  CarousselSelector _carousselSelector = new CarousselSelector();
  Item _item = new Item();

  @override
  void initState() {
    controller.searchRestaurantById(int.parse(controller.restaurantId));
    controller.searchProductByCategory(1);
    controller.getProductCategories();
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIThemeColors.whiteTheme,
      body: FutureBuilder(
          future: controller.searchRestaurantById(1),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: const CircularProgressIndicator(strokeWidth: 2.0),
              );
            return Stack(
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.6,
                    color: UIThemeColors.whiteTheme,
                    child: Image.network(
                      'https://image.freepik.com/fotos-gratis/hamburguer-de-vista-frontal-em-um-carrinho_141793-15542.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    title: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          color: UIThemeColors.whiteTheme,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15.0,
                              color: Colors.black26,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.chevron_left_rounded,
                          size: 18.0,
                          color: UIThemeColors.blackTheme,
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          width: 35.0,
                          decoration: BoxDecoration(
                            color: UIThemeColors.whiteTheme,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15.0,
                                color: Colors.black26,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.more_vert_rounded,
                            size: 18.0,
                            color: UIThemeColors.blackTheme,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: UIThemeColors.whiteTheme,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 50.0,
                            ),
                            Observer(builder: (_) {
                              return Text(
                                controller.restaurantInfo[0].name,
                                style: TextStyle(
                                  color: UIThemeColors.blackTheme,
                                  fontSize: 24.0,
                                ),
                              );
                            }),
                            Center(
                              child: Container(
                                width: 250,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 80.0,
                                      decoration: BoxDecoration(
                                        color: UIThemeColors.whiteTheme,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 20.0,
                                            offset: Offset(0, 1),
                                            color: Colors.grey.shade200,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.delivery_dining,
                                            size: 18.0,
                                            color: UIThemeColors.orangeTheme,
                                          ),
                                          Text(
                                            'Grátis',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: UIThemeColors.blackTheme,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30.0,
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                        color: UIThemeColors.whiteTheme,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 20.0,
                                            offset: Offset(0, 1),
                                            color: Colors.grey.shade200,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.access_time_rounded,
                                            size: 18.0,
                                            color: UIThemeColors.orangeTheme,
                                          ),
                                          Observer(builder: (_) {
                                            return Text(
                                              controller.restaurantInfo[0]
                                                      .startStandbyTime
                                                      .toString() +
                                                  '-' +
                                                  controller.restaurantInfo[0]
                                                      .endStandbyTime
                                                      .toString(),
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: UIThemeColors.blackTheme,
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30.0,
                                      width: 55.0,
                                      decoration: BoxDecoration(
                                        color: UIThemeColors.whiteTheme,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 20.0,
                                            offset: Offset(0, 1),
                                            color: Colors.grey.shade200,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.star_rounded,
                                            size: 18.0,
                                            color: UIThemeColors.orangeTheme,
                                          ),
                                          Text(
                                            '4.7',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: UIThemeColors.blackTheme,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30.0,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.menu_rounded),
                              color: UIThemeColors.blackTheme,
                              iconSize: 18,
                              onPressed: () {},
                            ),
                            Observer(
                              builder: (_) {
                                return ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      controller.productCategoriesInfo.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          _carousselSelector.item(
                                    colorIndex: selectedIndex == index,
                                    categoryText: controller
                                        .productCategoriesInfo[index].title,
                                    onPressed: () async {
                                      await controller.searchProductByCategory(
                                          controller
                                              .productCategoriesInfo[index]
                                              .productCategoryId);
                                      setState(() {});
                                      selectedIndex = index;
                                    },
                                    onSelectedColor: Colors.grey.shade100,
                                    notSelectedColor: UIThemeColors.whiteTheme,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: (MediaQuery.of(context).size.height / 2) - 10,
                        child: GridView.builder(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: controller.productInfo.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2.0,
                            childAspectRatio: 0.65,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return ListView(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                left: 8.0,
                                right: 8.0,
                              ),
                              physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                _item.product(
                                  image: Image.network(
                                      controller.productInfo[index].image),
                                  name: controller.productInfo[index].name,
                                  volume: controller.productInfo[index].volume,
                                  measurementUnit: controller
                                      .productInfo[index].measurementUnit,
                                  price: controller.productInfo[index].price,
                                  onPressed: () {
                                    Map<String, dynamic> productArguments =
                                        new Map<String, dynamic>();
                                    productArguments['restaurantId'] =
                                        int.parse(controller.restaurantId);
                                    productArguments['productId'] =
                                        controller.productInfo[index].productId;
                                    Modular.to.pushNamed(
                                      "/store_module/item_selector",
                                      arguments: productArguments,
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 5,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    width: 75.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: UIThemeColors.whiteTheme,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 15.0,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.network(
                        'https://static.expressodelivery.com.br/imagens/logos/67927/Expresso-Delivery_2e60369e451581bddfa63ad76984bdf9.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: SpeedDial(
        icon: Icons.shopping_cart_rounded,
        visible: true,
        overlayColor: Colors.black,
        overlayOpacity: 0.0,
        tooltip: 'Carrinho de Compras',
        heroTag: 'cart',
        backgroundColor: UIThemeColors.orangeTheme,
        foregroundColor: UIThemeColors.whiteTheme,
        elevation: 0.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.shopping_bag),
            backgroundColor: UIThemeColors.orangeTheme,
            labelBackgroundColor: Colors.white,
            elevation: 8.0,
            labelWidget: Container(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 15.0,
                right: 15.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: UIThemeColors.whiteTheme,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20.0,
                    color: Colors.grey.shade200,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Text(
                'Lista',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
            onTap: () {
              Map<String, dynamic> cartArguments = new Map<String, dynamic>();
              cartArguments['restaurantId'] = controller.restaurantId;
              Modular.to.pushNamed(
                "/store_module/cart",
                arguments: cartArguments,
              );
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.close),
            backgroundColor: Colors.deepPurple,
            labelBackgroundColor: Colors.white,
            elevation: 8.0,
            labelWidget: Container(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 15.0,
                right: 15.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: UIThemeColors.whiteTheme,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20.0,
                    color: Colors.grey.shade200,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Text(
                'Finalizar Pedido',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
